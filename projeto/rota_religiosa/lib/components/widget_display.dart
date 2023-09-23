import 'package:flutter/material.dart';

// ignore: camel_case_types
class widgetDisplay extends StatelessWidget {
  const widgetDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Projeto de extensão',
              style: TextStyle(fontFamily: 'Kanit', fontSize: 20)),
          Container(
              height: 70,
              width: 70,
              child: Image(image: AssetImage('assets/icons/icon_unama.png'))),
          const Text('Faculdade Unama',
              style: TextStyle(fontFamily: 'Kanit', fontSize: 20)),
        ]));
  }
}
