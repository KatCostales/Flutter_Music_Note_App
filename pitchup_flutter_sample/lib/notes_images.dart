import 'package:flutter/material.dart';
import 'dart:math';
import 'package:analyzer_plugin/utilities/pair.dart';


List<Pair<Image, String>> _notes = [ Pair(Image.asset('assets/c4.png'), "C4"), Pair(Image.asset('assets/d4.png'), "D4"), Pair(Image.asset('assets/e4.png'), "E4"), Pair(Image.asset('assets/f4.png'), "F4"), Pair(Image.asset('assets/g4.png'), "G4"), Pair(Image.asset('assets/a4.png'), "A4"), Pair(Image.asset('assets/b4.png'), "B4")];
final _random = Random();

class NoteImage {
  static Pair random() {
    return _notes[_random.nextInt(_notes.length-1)];
  }
}