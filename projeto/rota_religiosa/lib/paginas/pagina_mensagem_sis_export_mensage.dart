import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_msg.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaginoMensagemSistema_msg_export extends StatelessWidget {
  bool erro = false;
  PaginoMensagemSistema_msg_export({super.key, erro = false});

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
                              ? 'envio efetuado com SUCESSO! \n O que deseja fazer?'
                              : 'erro ao realizar envio \n O que deseja fazer?',
                        ),
                        Widgetbuttom(
                            titulo: 'ir para menu',
                            onTap: () => {
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst)
                                }),

                        // =============================================
                      ])))),
              Widgetbottom()
            ],
          )),
    );
  }
}
