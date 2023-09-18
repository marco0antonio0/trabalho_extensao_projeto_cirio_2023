import 'package:app_cirio/paginas/pagina_home.dart';
import 'package:flutter/material.dart';

class Widgettopbar extends StatelessWidget {
  const Widgettopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 4),
            blurRadius: 4.0,
            spreadRadius: 0)
      ]),
      child: Row(
        children: [
          //==============================================
          // container icon home
          Container(
            height: 85,
            width: MediaQuery.of(context).size.width * 0.3,
            alignment: Alignment.center,
            child: Container(
                // color: Colors.green,
                height: 85,
                width: (MediaQuery.of(context).size.width * 0.3) - 30,
                padding: EdgeInsets.symmetric(vertical: 5),
                //========================================
                // função de clique do btn
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PaginoHome()));
                  },
                  child: const Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/icons/icon_home.png')),
                )
                //========================================
                ),
          ),
          //==============================================
          // container titulo
          Container(
            height: 85,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.4,
            child: const Text(
              'Círio 2023',
              style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xffBE904C),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          //==============================================
          // margem
          Container(
            height: 85,
            width: MediaQuery.of(context).size.width * 0.3,
            // color: Colors.green,
          )
          //==============================================
        ],
      ),
    );
  }
}
