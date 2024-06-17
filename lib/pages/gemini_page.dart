import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

class GeminiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GeminiPage();
}

class _GeminiPage extends State<GeminiPage> {
  final gemini = Gemini.instance;
  String input = '';
  String value2 = '';
  List<Text> textList = [];

  @override
  Widget build(BuildContext context) {
    print(value2 +
        "INICIOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        SingleChildScrollView(
          child: Stack(
            children: textList,
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                  flex: 8,
                  child: TextField(
                      onChanged: (value) => {input = value},
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ))),
              Expanded(
                  flex: 2,
                  child: TextButton(
                      onPressed: () => _geminiChat(input),
                      child: Text('Enviar')))
            ],
          ),
        )
      ],
    )));
  }

  _geminiChat(String value) {
    textList.clear();
    gemini.streamGenerateContent(value).listen((event) {
      setState(() {
        textList.add(Text(event.output!));
      });
    }).onError((e) {
      printError(info: e);
    });
  }
}
