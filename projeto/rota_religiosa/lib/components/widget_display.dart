import 'package:flutter/material.dart';

// ignore: camel_case_types
class widgetDisplay extends StatelessWidget {
  const widgetDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Projeto de extensão',
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 20)),
              SizedBox(
                  height: 70,
                  width: 70,
                  child:
                      Image(image: AssetImage('assets/icons/icon_unama.png'))),
              Text('Faculdade Unama',
                  style: TextStyle(fontFamily: 'Kanit', fontSize: 20)),
            ]));
  }
}
