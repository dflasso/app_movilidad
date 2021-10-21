import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';

class Speecher extends StatefulWidget {
  const Speecher({Key? key}) : super(key: key);

  @override
  _SpeecherState createState() => _SpeecherState();
}

enum TtsState { playing, stopped, paused, continued }

class _SpeecherState extends State<Speecher> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        ElevatedButton(
          style: style,
          onPressed: () => audioCache.play('obstaculo_3_metros.mp3'),
          child: const Text('Prueba Asistente de voz'),
        ),
      ]),
    );
  }
}
