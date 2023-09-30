import 'package:flutter/material.dart';
import 'package:rota_religiosa/components/widget_colunms_cards.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';

//==================================
//Stateless para página de consulta/coluna de cadastrados.
class PaginaConsulta extends StatelessWidget {
  const PaginaConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 237, 182, 55),
      child: Container(
        color: const Color.fromARGB(255, 237, 182, 55),
        child: SafeArea(
          child: Scaffold(
              backgroundColor: const Color(0xffEBE9EC),
              body: Column(
                children: [
                  Widgettopbar(),
                  Expanded(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          // ignore: prefer_const_constructors
                          child: SingleChildScrollView(
                            child: Column(children: [
                              // =============================================
                              // Componente de titulo >>>>> 'CADASTRADOS'
                              WidgetTitulo(
                                titulo: 'CADASTRADOS',
                                height: 75,
                              ),
                              //======================================
                              //Colocar um 'const' antes da função: ColunaDeCadastrados().
                              const ColunaDeCadastrados(),
                              // =============================================
                            ]),
                          )))
                ],
              )),
        ),
      ),
    );
  }
}
