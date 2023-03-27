import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class MyTranslator extends StatefulWidget {
  const MyTranslator({super.key});

  @override
  _MyTranslatorState createState() => _MyTranslatorState();
}

class _MyTranslatorState extends State<MyTranslator> {
  final inputTranslateController = TextEditingController();
  final translator = GoogleTranslator();
  String translatedText = '';

  void translate() async {
    final translation =
        await translator.translate(inputTranslateController.text, to: 'fr');
    setState(() {
      translatedText = translation.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: inputTranslateController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            ElevatedButton(
              onPressed: translate,
              child: Text('Translate'),
            ),
            SizedBox(height: 20),
            Text(translatedText),
          ],
        ),
      ),
    );
  }
}
