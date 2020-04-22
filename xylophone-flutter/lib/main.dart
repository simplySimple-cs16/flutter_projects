import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber, String cord}) {
    return Expanded(
      child: FlatButton(
        child: Transform.rotate(
          angle: 45,
          child: Text(
            cord,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
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
              buildKey(color: Colors.pink, soundNumber: 1, cord: 'Sa'),
              buildKey(color: Colors.orange, soundNumber: 2, cord: 'Re'),
              buildKey(color: Colors.yellow, soundNumber: 3, cord: 'Ga'),
              buildKey(color: Colors.green, soundNumber: 4, cord: 'Ma'),
              buildKey(color: Colors.teal, soundNumber: 5, cord: 'Pa'),
              buildKey(color: Colors.blue, soundNumber: 6, cord: 'Da'),
              buildKey(color: Colors.purple, soundNumber: 7, cord: 'Ni'),
              buildKey(color: Colors.red[700], soundNumber: 8, cord: 'Sa'),
            ],
          ),
        ),
      ),
    );
  }
}
