//import 'dart:html';
import 'dart:async';
import 'dart:typed_data';
import 'dart:math';
import 'package:analyzer_plugin/utilities/pair.dart';

import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:go_router/go_router.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../presenter/index_page_provider.dart';

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

class FlashcardPage extends StatelessWidget {
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
            context.go('/home');
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
  var prevNote = "";
  var status = "Click on start";

  // Flipping animation stuff
  bool isBack = false;
  double angle = 0;

  bool wrongNote = false;

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
    var appState = context.watch<IndexPageProvider>();
    var noteImage = appState.currentNote;
    var isEqual = note == noteImage.last;


    // Start recording when the page is built (note starts out as "")
    if (note == "") {
      startCapture();
    }

    // After exiting the page, stop recording
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!Navigator.canPop(context)) {
        stopCapture();
      }
    });

    // If the note being played matches the note being displayed, move on to the next note
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isEqual) {
        prevNote = noteImage.last;
        appState.getNext();
      }
    });

    // If an incorrect note is played, set the wrongNote flag to true for 1 second
    if (note.length == 2 &&
        !isEqual &&
        note != prevNote) {
      wrongNote = true;
      Timer(Duration(seconds: 1), () {
        wrongNote = false;
      });
    } else {
      Timer(Duration(seconds: 1), () {
        wrongNote = false;
      });
    }

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
                  isBack = false;
                } else {
                  isBack = true;
                }
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // add perspective to the card
                    ..rotateY(val), // allow us to rotate the card
                  child: SizedBox(
                    width: 309,
                    height: 474,
                    child: isBack
                        ? Stack(
                            alignment: Alignment.center,
                            children: [
                              BigCard(note: noteImage.first),
                              AnimatedOpacity(
                                duration: const Duration(seconds: 1),
                                opacity: wrongNote ? 1.0 : 0.0, // Fade in and out over a 1 second period
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text('Try again!'),
                                ),
                              ),
                            ],
                          )
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
                  ),
                ));
              }),
        ),
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
  });

  final Image? note;  // Image of the current note

  @override
  Widget build(BuildContext context) {
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
