import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherView extends StatelessWidget {
  const OtherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tools',
              style: GoogleFonts.montserratAlternates(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
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
