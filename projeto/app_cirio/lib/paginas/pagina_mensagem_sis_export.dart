import 'package:app_cirio/components/widget_bottomBar.dart';
import 'package:app_cirio/components/widget_buttom.dart';
import 'package:app_cirio/components/widget_msg.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:flutter/material.dart';

class PaginoMensagemSistemaExport extends StatelessWidget {
  const PaginoMensagemSistemaExport({super.key});

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
                        // Componente titulo >>>> ' MENSAGEM SISTEMA '
                        WidgetTitulo(titulo: 'MENSAGEM SISTEMA'),
                        //=============================================
                        // Mensagem: 'Parabéns, o banco de dados esta pronto para ser enviado /nO que deseja fazer?
                        WidgetMensagemSis(
                          MensagemSis:
                              'Parabéns, o banco de dados esta pronto para ser enviado \nO que deseja fazer?',
                        ),
                        //=============================================
                        //        Botão de envio via whatsapp
                        Widgetbuttom(
                          titulo: 'Enviar via whatsapp',
                          onTap: () => {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => PaginoEditarpefil()))
                          },
                        ),
                        //====================================================
                        // Botão: 'Voltar'
                        Widgetbuttom(
                          titulo: 'Voltar',
                          marginTop: 0,
                          onTap: () => {Navigator.of(context).pop()},
                        ),
                        // =============================================
                      ])))),
              Widgetbottom()
            ],
          )),
    );
  }
}
