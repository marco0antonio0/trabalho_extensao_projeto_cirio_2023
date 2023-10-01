import 'package:flutter/material.dart';

//=====================================
//TopBar
//=====================================

// ignore: must_be_immutable
class Widgettopbar extends StatelessWidget {
  bool home;
  Widgettopbar({super.key, this.home = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Color(0xffEDB637), boxShadow: [
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
                padding: const EdgeInsets.symmetric(vertical: 8),
                //========================================
                // função de clique do btn
                child: InkWell(
                  onTap: !home
                      ? () => Navigator.of(context)
                          .popUntil((route) => route.isFirst)
                      : null,
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
                  color: Color(0xffF4F4F2),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          //==============================================
          // margem
          SizedBox(
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
