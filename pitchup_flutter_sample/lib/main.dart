import 'dart:math';
import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/material.dart';
import 'package:pitchupfluttersample/mysql/mysql.dart';
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

// class MyAppState extends ChangeNotifier {
//   //ChangeNotifier means that is can notify others about its own changes
//   final random = Random();
//   var currentNote = NoteImage.random();

//   var db = Mysql();

//   void getNext() {
//     var temp = NoteImage.random();
//     while (temp == currentNote) {
//       temp = NoteImage.random();
//       //temp = NoteImage.random();
//     }
//     currentNote = temp;
//     notifyListeners(); // a method of Change Notifier that ensures that anyone watching MyAppState is notified
//   }
// }

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