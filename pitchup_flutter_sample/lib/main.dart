// import 'dart:typed_data';
// import 'package:permission_handler/permission_handler.dart';
// import 'dart:math';
// import 'package:analyzer_plugin/utilities/pair.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_audio_capture/flutter_audio_capture.dart';
// import 'package:pitch_detector_dart/pitch_detector.dart';
// import 'package:pitchupdart/instrument_type.dart';
// import 'package:pitchupdart/pitch_handler.dart';

//Edits
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// Example code from https://github.com/techpotatoes/pitchup_flutter_sample
/// 
///

void main() {
  runApp(const MyApp());
}

// Start of Pitch Up Code

// String getNote(double pitch) {
//   // notes in order: C0, D0, E0, F0, G0, A0, B0
//   // TODO: add sharps/flats
//   List<Pair<double, String>> baseNotes = [Pair(16.35, "C"), Pair(18.35, "D"), Pair(20.60, "E"), Pair(21.83, "F"), Pair(24.50, "G"), Pair(27.50, "A"), Pair(30.87, "B")];
//   double exponent = 0;  // The exponent 2 is raised to in order to match pitch
//   double reducedExponent = 0; // exponent reduced to below 0
//   int octave = 0;
//   String note = "";


//   // Check if the pitch given has a base 2 exponent (with some clearance) when divided by each of the base notes
//   // If one of the base notes meets the requirement, store the index number and assign note the String value of the corresponding baseNotes pair
//   for (int i = 0; i < 7; i++) {
//     exponent = log(pitch/baseNotes[i].first)/log(2);  // Use logarithms to get the base 2 exponent from pitch
//     reducedExponent = exponent;
//     // Reduce exponent to value closest to either 0 (if pitch is slightly flat) or -1 (if pitch is slightly sharp)
//     while (reducedExponent > 0) {
//       reducedExponent -= 1;
//     }
//     // If reduced exponent is just below 0 or just above -1, update note and octave and return the note being played
//     if (reducedExponent > -0.01 || reducedExponent < -0.99) {
//       note = baseNotes[i].last;
//       octave = int.parse((log(pitch/baseNotes[i].first)/log(2)).toStringAsFixed(0));
//       return "$note$octave";
//     }
//   }
//   return "N/A";
// }

//Step 1  ---- Step 7:
//Myapp sets up the whole app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 224, 248, 162)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

//MyAppState class defines the app's state. It defined the data the app need to function
class MyAppState extends ChangeNotifier {   //ChangeNotifier means that is can notify others about its own changes
  var current = WordPair.random();  //Generates random word pair from library

  void getNext(){
    current = WordPair.random();
    notifyListeners();  // a method of Change Notifier that ensures that anyone watching MyAppState is notified
  }

  var favorites = <WordPair>[];

  void toggleFavorite(){
    if (favorites.contains(current)){
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

//MyHomePage  every weidget defines a build() method, tracks changes to the app's current state `watch` method
// Old MyHomePage based on Step 1-7 replaced with code on Step 7
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current;

//     IconData icon;
//     if(appState.favorites.contains(pair)){
//       icon =Icons.favorite;
      
//     } else {
//       icon =Icons.favorite_border;
//     }

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Click to Start'),
//             BigCard(pair: pair),
//             SizedBox(height: 50),   // Utilized to create visual gaps
//             //Add a button
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [

//                 ElevatedButton.icon(onPressed:(){
//                   appState.toggleFavorite();
//                 },
//                 icon:Icon(icon),
//                 label: Text('Like'),
//                 ),
//                 SizedBox(width: 10,),

//                 ElevatedButton(onPressed: (){
//                   appState.getNext();
//                 },
//                 child: Text('Thank you, Next'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: true,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: 0,
              onDestinationSelected: (value) {
                print('selected: $value');
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: GeneratorPage(),
            ),
          ),
        ],
      ),
    );
  }
}


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!.copyWith(color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Text(pair.asLowerCase, 
        style:style,
        semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
////Step 1  ---- Step 7 Stated above

//   @override
//   Widget build(BuildContext context) {
//     Permission.microphone.request();  // Request microphone permission
//     return MaterialApp(
//       title: 'Flutter Demo',
//       // theme: ThemeData(
//       //   primarySwatch: const Color.fromARGB(255, 210, 224, 157),
//       // ],
//       theme: ThemeData(primarySwatch:Colors.lightBlue),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }

// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();

// }


// // ...
// class _MyHomePageState extends State<MyHomePage> {
//   final _audioRecorder = FlutterAudioCapture();
//   final pitchDetectorDart = PitchDetector(44100, 2000);
//   final pitchupDart = PitchHandler(InstrumentType.guitar);

//   var note = "";
//   var status = "Click on start";

//   Future<void> _startCapture() async {
//     await _audioRecorder.start(listener, onError,
//         sampleRate: 44100, bufferSize: 3000);

//     setState(() {
//       note = "";
//       status = "Start Recording";
//     });
//   }

//   Future<void> _stopCapture() async {
//     await _audioRecorder.stop();

//     setState(() {
//       note = "";
//       status = "Click Start to Record";
//     });
//   }

//   void listener(dynamic obj) {
//     //Gets the audio sample
//     var buffer = Float64List.fromList(obj.cast<double>());
//     final List<double> audioSample = buffer.toList();

//     //Uses pitch_detector_dart library to detect a pitch from the audio sample
//     final result = pitchDetectorDart.getPitch(audioSample);

//     //If there is a pitch - evaluate it
//     if (result.pitched) {
//       //Uses the pitchupDart library to check a given pitch for a Guitar
//       //final handledPitchResult = pitchupDart.handlePitch(result.pitch);

//       //Updates the state with the result
//       setState(() {
//         //note = getNote(result.pitch);
//         note = getNote(result.pitch);
//         //status = handledPitchResult.tuningStatus.toString();
//         status = result.pitch.toString();
//       });
//     }
//   }

//   void onError(Object e) {
//     //print(e);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(children: [
//           Center(
//               child: Text(
//             note,
//             style: const TextStyle(
//                 color: Colors.black87,
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.bold),
//           )),
//           const Spacer(),
//           Center(
//               child: Text(
//             status,
//             style: const TextStyle(
//                 color: Colors.black87,
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.bold),
//           )),
//           Expanded(
//               child: Row(
//             children: [
//               Expanded(
//                   child: Center(
//                       child: FloatingActionButton(
//                           onPressed:
//                             _startCapture, child: const Text("Start")))),
//               Expanded(
//                   child: Center(
//                       child: FloatingActionButton(
//                           onPressed: _stopCapture, child: const Text("Stop")))),
//             ],
//           ))
//         ]),
//       ),
//     );
//   }
// }

