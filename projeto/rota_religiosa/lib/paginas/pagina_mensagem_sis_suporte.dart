import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_display.dart';
import 'package:rota_religiosa/components/widget_msg.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaginoMensagemSistemaSobre extends StatelessWidget {
  PaginoMensagemSistemaSobre({super.key});

  String text1 =
      'O Projeto app Cirio 2023 é uma iniciativa do Grupo academico extensão unama 2 semestre para facilitar o cadastro de participantes no evento Cirio. Desenvolvemos um aplicativo Android usando Flutter e Dart, com suporte offline usando um banco de dados SQLite.';
  // desenvolvedores
  String text2 = '''
- Marco Antonio
- Felipe Moura
- Melize Rocha
- Matheus Barbosa
- Igor Costa''';
// desing
  String text3 = '''
- Marco Antonio
- Alexsandro Fernandes
- Henri Deluca
- Iago Dantas
- Breno Luiz''';
// banco de dados
  String text4 = '''
- Marco Antonio
- Jean Dias
- Fabricio Augusto 
- Rellan Monteiro 
- Mateus Nunes
- Felipe neri''';
// documentação
  String text5 = '''
- Alexsandro Fernandes
- Brenda Gomes
- Maycon Bruno
- Hugo Ribeiro
- Tales Costa
- Thiago Farias''';

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            // ignore: prefer_const_constructors
                            child: Column(children: [
                          // =============================================
                          WidgetTitulo(titulo: 'Sobre o app'),
                          WidgetMensagemSis(MensagemSis: text1),
                          const widgetDisplay(),
                          // =============================================
                          WidgetTitulo(
                              titulo: 'Equipe Desenvolvedores', height: 60),
                          WidgetMensagemSis(MensagemSis: text2),
                          // =============================================
                          WidgetTitulo(titulo: 'Equipe Design', height: 60),
                          WidgetMensagemSis(MensagemSis: text3),
                          // =============================================
                          WidgetTitulo(
                              titulo: 'Equipe banco de dados ', height: 60),
                          WidgetMensagemSis(MensagemSis: text4),
                          // =============================================
                          WidgetTitulo(
                              titulo: 'Equipe documentação ', height: 60),
                          WidgetMensagemSis(MensagemSis: text5),
                          // =============================================
                          WidgetTitulo(
                            titulo: 'Contato com suporte',
                            height: 70,
                          ),
                          WidgetMensagemSis(
                            MensagemSis:
                                'Entre em contato com nosso suporte ao app \n numero de contato whatsapp:\n91 984837847',
                          ),

                          const Widgetbottom()

                          // =============================================
                        ])))),
              ],
            )),
      ),
    );
  }
}
