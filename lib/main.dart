import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/src/audio_cache.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: XylophoneApp(),
    );
  }
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  late final AudioPlayer _player;
  Widget buildButton({
    required int nn,
    required Color backgroundColor,
  }) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          _player.play(AssetSource('note$nn.wav'));
        },
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // No rounded corners
          ),
        ),
        child: const SizedBox(width: 50, height: 20),
      ),
    );
  }

  @override
  void initState() {
    _player = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //button1
              buildButton(nn: 1, backgroundColor: Colors.red),
              //button2
              buildButton(nn: 2, backgroundColor: Colors.orange.shade500),
              //button3
              buildButton(nn: 3, backgroundColor: Colors.yellow),
              //button4
              buildButton(nn: 4, backgroundColor: Colors.green.shade600),
              //button5
              buildButton(nn: 5, backgroundColor: Colors.teal.shade900),
              //button6
              buildButton(nn: 6, backgroundColor: Colors.blue.shade800),
              //button7
              buildButton(nn: 7, backgroundColor: Colors.purple.shade900),
            ],
          ),
        ),
      ),
    );
  }
}
