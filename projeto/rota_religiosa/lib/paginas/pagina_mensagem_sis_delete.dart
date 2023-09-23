import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_msg.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:flutter/material.dart';

//StatelessWidget de mensagem de Delete de cadastrados;
// ignore: must_be_immutable
class PaginoMensagemSistemaDelete extends StatelessWidget {
  bool erro;
  PaginoMensagemSistemaDelete({super.key, this.erro = false});

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
                        WidgetTitulo(titulo: 'MENSAGEM SISTEMA'),
                        WidgetMensagemSis(
                          MensagemSis: !erro
                              ? 'Deletado com SUCESSO \n O que deseja fazer?'
                              : 'Erro ao Deletar \n O que deseja fazer?',
                        ),

                        Widgetbuttom(
                          titulo: 'Ir ara o menu',
                          onTap: () => Navigator.of(context)
                              .popUntil((route) => route.isFirst),
                        ),
                        // =============================================
                      ])))),
              Widgetbottom()
            ],
          )),
    );
  }
}
