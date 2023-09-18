import 'package:app_cirio/components/widget_bottomBar.dart';
import 'package:app_cirio/components/widget_menu.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:flutter/material.dart';

class PaginoHome extends StatelessWidget {
  const PaginoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffEBE9EC),
          body: Column(
            children: [
              Widgettopbar(),
              Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      // ignore: prefer_const_constructors
                      child: SingleChildScrollView(
                          // ignore: prefer_const_constructors
                          child: Column(children: [
                        // =============================================
                        WidgetTitulo(titulo: 'INICIO'),
                        Widgetmenu(),

                        // =============================================
                      ])))),
              Widgetbottom()
            ],
          )),
    );
  }
}
