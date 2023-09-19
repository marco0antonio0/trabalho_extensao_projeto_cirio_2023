import 'package:flutter/material.dart';

class Widgetbottom extends StatelessWidget {
  const Widgetbottom({super.key});

  @override
  Widget build(BuildContext context) {
    //====================================================
    //  component xx  xxx
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Image(
          fit: BoxFit.fitWidth, image: AssetImage('assets/bottombar.png')),
    );
  }
}
