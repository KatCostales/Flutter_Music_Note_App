//import 'dart:html';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';
import 'dart:math';
import 'package:analyzer_plugin/utilities/pair.dart';

import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notes_images.dart';

//Imports for UI Landing Page
import 'package:argo/argo.dart';
import 'app/presenter/index_page_provider.dart';
import 'config/router/router.dart';
import 'config/theme/theme.dart';
import 'core/navigator/navigator.dart';

///
/// Example code from https://github.com/techpotatoes/pitchup_flutter_sample
///
///

void main() {
// runApp(ChangeNotifierProvider(
//   create: (_) => index_page_provider(),
//   child:const MyApp(),
// );
  runApp(MyApp());
}

// Start of Pitch Up Code

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

//Step 1  ---- Step 7:Cite: My first flutter app
//Myapp sets up the whole app
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final exaRouter = JRouter();
//Stateless widget, unchanging
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Permission.microphone.request();

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // removes debug check banner
        title: 'title',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 224, 248, 162)),
          scaffoldBackgroundColor: const Color.fromARGB(255, 224, 248, 162),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

//MyAppState class defines the app's state. It defined the data the app needs to function
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

class MyHomePage extends StatefulWidget {
  //stateful widgets can be changed throughout app interactions
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = LandingPage();
        break;
      case 1:
        page = FlashcardPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ),
          BottomNavigationBar(
            elevation: 0,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_stories_outlined),
                label: 'Flashcards',
              ),
            ],
            currentIndex: selectedIndex,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  final String image = "assets/Green_and_White_Music_Logo.png"; //Melody logo
  final String logo =
      "assets/Grey_Aesthetic_Music_Mood_Instagram_Post.png"; //melody music player

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          alignment: Alignment.center,
          child: Image.asset(
            logo,
            fit: BoxFit.contain,
          )), // Container
      Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0)
                  ]),
              margin: EdgeInsets.all(48.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover), //Decoration Image
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ) // Border Radius only
                          ), //Box Decoration
                    ), //Container
                  ), //expanded
                ], // children, widget
              ), // child, column
            ), // child, container
          ), //expanded
          // SizedBox(height: 30.0),
          // Text(
          //   "Melody",
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 24.0,
          //     // backgroundColor: Colors.white,
          //   ),
          // ), // user introduction
          SizedBox(height: 10.0),
          Card(
            color: Color.fromARGB(255, 255, 255, 255),
            child: Text(
              "With our versatile music learning app, musicians, beginner or seasoned pro, are able to hone their musical talents to another level",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ),
          SizedBox(height: 40.0),
        ],
      ),
      SizedBox(
        height: 20.0,
      ),
    ]));
  }
}

class FlashcardPage extends StatelessWidget {
  //NotesRoute notesRoute = const NotesRoute();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Flashcards',
            textAlign: TextAlign.center,
            textScaleFactor: 3,
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotesRoute()),
            );
          },
          child: const Text('Notes'),
        ),
        ElevatedButton(
          onPressed: () {
            print('intervals');
          },
          child: const Text('Intervals'),
        ),
        ElevatedButton(
          onPressed: () {
            print('chords');
          },
          child: const Text('Chords'),
        ),
      ],
    );
  }
}

class NotesRoute extends StatefulWidget {
  const NotesRoute({super.key});

  @override
  State<NotesRoute> createState() => _NotesRouteState();
}

class _NotesRouteState extends State<NotesRoute> {
  final audioRecorder = FlutterAudioCapture();
  final pitchDetectorDart = PitchDetector(44100, 2000);

  var note = "";
  var status = "Click on start";

  // Flipping animation stuff
  bool isBack = false;
  double angle = 0;

  // change angle of card
  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  void listener(dynamic obj) {
    //Gets the audio sample
    var buffer = Float64List.fromList(obj.cast<double>());
    final List<double> audioSample = buffer.toList();

    //Uses pitch_detector_dart library to detect a pitch from the audio sample
    final result = pitchDetectorDart.getPitch(audioSample);

    //If there is a pitch - evaluate it
    if (result.pitched) {
      //Uses the pitchupDart library to check a given pitch for a Guitar
      //final handledPitchResult = pitchupDart.handlePitch(result.pitch);

      setState(() {
        note = calculateNote(result.pitch);
        status = result.pitch.toString();
      });
    }
  }

  void onError(Object e) {
    print(e);
  }

  Future<void> startCapture() async {
    await audioRecorder.start(listener, onError,
        sampleRate: 44100, bufferSize: 3000);

    setState(() {
      note = "";
      status = "Start Recording";
    });
  }

  Future<void> stopCapture() async {
    await audioRecorder.stop();

    setState(() {
      note = "N/A";
      status = "Click Start to Record";
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var noteImage = appState.currentNote;
    var isEqual = note == noteImage.last;

    if (note == "") {
      startCapture();
    }
    if (!Navigator.canPop(context)) {
      stopCapture();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isEqual) {
        appState.getNext();
      }
    });

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _flip,
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: angle),
              duration: const Duration(seconds: 1),
              builder: (BuildContext context, double val, __) {
                if (val >= (pi / 2)) {
                  isBack = true;
                } else {
                  isBack = false;
                }
                return (Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // add perspective to the card
                      ..rotateY(val), // allow us to rotate the card
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(pi),
                        child: SizedBox(
                          width: 309,
                          height: 474,
                          child: isBack
                              ? BigCard(note: noteImage.first)
                              : Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()..rotateY(pi),
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(50),
                                        child: Text(noteImage.last),
                                      ),
                                    ),
                                  ),
                                ),
                        ))));
              }),
        ),
        // BigCard(
        //   note: noteImage.first,
        // ),
        SizedBox(height: 10),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('SKIP'),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.note,
    // required this.isEqual,
    // required void Function(String note, String noteImageName) onIsEqual,
  });

  final Image? note;
  // final void isEqual;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: note,
      ),
    );
  }
}
