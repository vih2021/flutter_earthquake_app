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
  Text textWigget = new Text('');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Gemini"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  child: textWigget,
                )
              ],
            )),
          ),
          Row(
            children: [
              Expanded(
                  flex: 8,
                  child: TextField(
                      onChanged: (value) => input = value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ))),
              Expanded(
                  flex: 2,
                  child: TextButton(
                      onPressed: () => _geminiChat(input),
                      child: Text('Enviar')))
            ],
          )
        ],
      ),
    ));
  }

  _geminiChat(String value) {
    gemini.text(value).then((event) {
      setState(() {
        textWigget = Text(event!.output!);
      });
    }).catchError((e) {
      printError(info: e);
    });
  }
}
