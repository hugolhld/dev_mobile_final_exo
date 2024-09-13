import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morse Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MorseTranslatorScreen(),
    );
  }
}

class MorseTranslatorScreen extends StatefulWidget {
  @override
  _MorseTranslatorScreenState createState() => _MorseTranslatorScreenState();
}

class _MorseTranslatorScreenState extends State<MorseTranslatorScreen> {
  // Table de traduction pour le code Morse
  final Map<String, String> morseCode = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
    'G': '--.', 'H': '....', 'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
    'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
    'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
    'Y': '-.--', 'Z': '--..', '1': '.----', '2': '..---', '3': '...--',
    '4': '....-', '5': '.....', '6': '-....', '7': '--...', '8': '---..',
    '9': '----.', '0': '-----', ' ': ' '
  };

  final TextEditingController _controller = TextEditingController();
  String _morseCode = '';

  String textToMorse(String text) {
    return text.toUpperCase().split('').map((char) {
      return morseCode[char] ?? '';
    }).join(' ');
  }

  void _updateMorseCode() {
    setState(() {
      _morseCode = textToMorse(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Morse Translator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter Text:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter text to translate',
              ),
              onChanged: (text) {
                _updateMorseCode();
              },
            ),
            SizedBox(height: 20),
            Text(
              'Morse Code:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              _morseCode,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
