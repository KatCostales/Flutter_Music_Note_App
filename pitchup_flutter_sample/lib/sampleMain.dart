import 'dart:math';
import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notes_images.dart';

//Imports for UI Landing Page
import 'package:argo/argo.dart';
import 'app/presenter/index_page_provider.dart';
import 'config/router/router.dart';
import 'config/theme/theme.dart';
import 'core/navigator/navigator.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => IndexPageProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final exaRouter = JRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routeInformationParser: exaRouter.routeInformationParser,
      routerDelegate: exaRouter.routerDelegate,
      builder: (_, child) => ResponsiveWrapper(
        wrapConfig: _wrapConfig,
        responsiveTheme: _responsiveTheme,
        child: NavigationWrapper(
          navigationService: exaRouter.router,
          child: child!,
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  //ChangeNotifier means that is can notify others about its own changes
  final random = Random();
  var currentNote = NoteImage.random();
  void getNext() {
    var temp = NoteImage.random();
    while (temp == currentNote) {
      temp = NoteImage.random();
      //temp = NoteImage.random();
    }
    currentNote = temp;
    notifyListeners(); // a method of Change Notifier that ensures that anyone watching MyAppState is notified
  }
}

final _wrapConfig = WrapperConfig(
  globalBreakpoints: ScreenBreakpoints.values(
    mobile: const SBValue.max(650),
    tablet: const SBValue.max(1200),
    desktop: const SBValue.inf(),
  ),
);

final _responsiveTheme = ResponsiveTheme.screen(
  conditionScreen: ConditionScreen(
    mobile: AppTheme(),
    tablet: AppTheme(),
    desktop: WebTheme(),
  ),
);

String calculateNote(double pitch) {
  // notes in order: C0, D0, E0, F0, G0, A0, B0
  // TODO: add sharps/flats
  List<Pair<double, String>> baseNotes = [
    Pair(16.35, "C"),
    Pair(18.35, "D"),
    Pair(20.60, "E"),
    Pair(21.83, "F"),
    Pair(24.50, "G"),
    Pair(27.50, "A"),
    Pair(30.87, "B")
  ];
  double exponent = 0; // The exponent is raised to in order to match pitch
  double reducedExponent = 0; // exponent reduced to below 0
  int octave = 0;
  String note = "";

  // Check if the pitch given has a base 2 exponent (with some clearance) when divided by each of the base notes
  // If one of the base notes meets the requirement, store the index number and assign note the String value of the corresponding baseNotes pair
  for (int i = 0; i < 7; i++) {
    exponent = log(pitch / baseNotes[i].first) /
        log(2); // Use logarithms to get the base 2 exponent from pitch
    reducedExponent = exponent;

    // Reduce exponent to value closest to either 0 (if pitch is slightly flat) or -1 (if pitch is slightly sharp)
    while (reducedExponent > 0) {
      reducedExponent -= 1;
    }

    // If reduced exponent is just below 0 or just above -1, update note and octave and return the note being played
    if (reducedExponent > -0.01 || reducedExponent < -0.99) {
      note = baseNotes[i].last;
      octave = int.parse(
          (log(pitch / baseNotes[i].first) / log(2)).toStringAsFixed(0));
      return "$note$octave";
    }
  }
  return "N/A";
}