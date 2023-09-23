import 'package:flutter/material.dart';

//================================
//Componente para Botões
//================================
// ignore: must_be_immutable
class Widgetbuttom extends StatelessWidget {
  String titulo;
  double height;
  double width;
  double marginTop;
  dynamic onTap = () => {};
  Widgetbuttom(
      {super.key,
      this.titulo = '',
      this.height = 60,
      this.width = 170,
      this.marginTop = 20,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    //===========================================================
    // componente buttom referece xxxxxx
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: marginTop, bottom: 20),
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color(0xffEDB637),
          borderRadius: BorderRadius.all(Radius.circular(60)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(158, 158, 158, 0.455), // Cor da sombra
              offset:
                  Offset(0, 3), // Deslocamento da sombra (horizontal, vertical)
              blurRadius: 5, // Raio do desfoque da sombra
              spreadRadius: 2, // Espalhamento da sombra
            )
          ],
        ),
        //========================================
        //  text titulo do botão variavel agregada
        child: Text(titulo,
            style: const TextStyle(
                fontSize: 18, fontFamily: 'Kanit', color: Colors.white)),
        //========================================
      ),
    );
  }
}
