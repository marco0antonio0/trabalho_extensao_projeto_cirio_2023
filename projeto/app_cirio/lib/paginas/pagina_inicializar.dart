import 'package:app_cirio/components/widget_buttom.dart';
import 'package:app_cirio/components/widget_input_component.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:flutter/material.dart';

class PaginoInicializar extends StatelessWidget {
  const PaginoInicializar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffEBE9EC),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Widgettopbar(),
                WidgetTitulo(titulo: 'PRIMEIRO ACESSO'),
                WidgetInputComponent(
                  titulo: 'Nome',
                ),
                WidgetInputComponent(
                  titulo: 'Telefone',
                ),
                WidgetInputComponent(
                  titulo: 'Bloco',
                ),
                Widgetbuttom(titulo: 'Iniciar app'),
              ],
            ),
          )),
    );
  }
}
