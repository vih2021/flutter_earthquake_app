import 'package:flutter/material.dart';
import 'package:flutter_earthquakes/models/log.dart';
import 'package:provider/provider.dart';

import '../controllers/history_controller.dart';

class HistoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Provider.of<LogHistoryController>(context, listen: false).items;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: mainSection(Provider.of<LogHistoryController>(context, listen: false).items)
      ),
    );
  }

  Widget mainSection(List<Log> histories) => SingleChildScrollView(
    child: ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text("${histories[index].data}, ${histories[index].day}, ${histories[index].magnetude}")
      ),
      separatorBuilder: (context, index) => const Divider(height: 1,),
      itemCount: histories.length)
  );
}