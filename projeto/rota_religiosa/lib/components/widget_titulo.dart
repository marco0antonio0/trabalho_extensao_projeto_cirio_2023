import 'package:flutter/material.dart';

//===========================
//widget para titulos
//===========================

// ignore: must_be_immutable
class WidgetTitulo extends StatelessWidget {
  double height;
  String titulo;
  WidgetTitulo({super.key, this.titulo = '', this.height = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width * 1,
      // color: Colors.green,
      alignment: Alignment.center,
      child: Text(
        titulo,
        //=========================
        //Sugestão: colocar 'const' antes de 'TextStyle()'
        //=========================
        style: const TextStyle(
            fontSize: 25, color: Color(0xffBE904C), fontFamily: 'Inter-medium'),
      ),
    );
  }
}
