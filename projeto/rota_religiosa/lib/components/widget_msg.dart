import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetMensagemSis extends StatelessWidget {
  String MensagemSis;
  WidgetMensagemSis({super.key, this.MensagemSis = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: 250,
      // margin: EdgeInsets.symmetric(horizontal: 50),
      child: Text(
        MensagemSis,
        style: TextStyle(fontFamily: 'Kanit', fontSize: 20),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
