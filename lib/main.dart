import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({Color color, int soundNumber, int textNo}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber);
        },
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        child: Text('$textNo'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: 1, textNo: 1),
              buildKey(color: Colors.orange, soundNumber: 2, textNo: 2),
              buildKey(color: Colors.yellow, soundNumber: 3, textNo: 3),
              buildKey(color: Colors.grey, soundNumber: 4, textNo: 4),
              buildKey(color: Colors.teal, soundNumber: 5, textNo: 5),
              buildKey(color: Colors.blue, soundNumber: 6, textNo: 6),
              buildKey(color: Colors.purple, soundNumber: 7, textNo: 7),
            ],
          ),
        ),
      ),
    );
  }
}
