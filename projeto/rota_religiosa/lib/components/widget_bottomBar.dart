// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Widgetbottom extends StatelessWidget {
  const Widgetbottom({super.key});

  @override
  Widget build(BuildContext context) {
    //====================================================
    //  component xx  xxx
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: const Image(
          fit: BoxFit.fitWidth, image: AssetImage('assets/bottombar.png')),
    );
  }
}
