import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

class GeminiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class _GeminiPage extends State<GeminiPage> {
  final gemini = Gemini.instance;
  String input = '';
  String? value;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          child: Text(value!),
        ),
        Container(
          child: Row(
            children: [
              TextField(
                onChanged: (value) => input = value,
              ),
              TextButton(onPressed: () => _geminiChat(input), child: Text('Enviar'))
            ],
          ),
        )
      ],
    );

  }

  _geminiChat(String value) {
    gemini.streamGenerateContent(value)
        .listen((event) {
          value = event.output!;
    }).onError((e) {
      printError(info: e);
    });
    return value;
  }

}