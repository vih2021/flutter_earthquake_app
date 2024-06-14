import 'package:flutter/material.dart';
import 'package:flutter_earthquakes/models/log.dart';
import 'package:provider/provider.dart';

import '../controllers/history_controller.dart';

class HistoryPage extends StatelessWidget {
  static bool isLogLoaded = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<LogHistoryController>(
            builder: (context, value, child) {
              if(!isLogLoaded){
                isLogLoaded = true;
                return mainSection(Provider.of<LogHistoryController>(context, listen: false).items);
              }else{
                return mainSection(value.items);
              }
            },
          )
      ),
    );
  }
 
  Widget mainSection(List<Log> histories) => SingleChildScrollView(
    child: ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text("Data: ${histories[index].data}  Data do Furacão: ${histories[index].day}  Magnitude: ${histories[index].magnetude}")
      ),
      separatorBuilder: (context, index) => const Divider(height: 1,),
      itemCount: histories.length)
  );
}