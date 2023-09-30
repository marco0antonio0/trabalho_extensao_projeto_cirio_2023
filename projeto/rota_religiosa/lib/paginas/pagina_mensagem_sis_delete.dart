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
    return Container(
      color: const Color.fromARGB(255, 237, 182, 55),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffEBE9EC),
            body: WillPopScope(
              onWillPop: () async {
                Navigator.of(context).popUntil((route) => route.isFirst);
                return false;
              },
              child: Column(
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
                  const Widgetbottom()
                ],
              ),
            )),
      ),
    );
  }
}
