import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_msg.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//==================================================
//StatelessWidget de confirmação de saída do app;
// ignore: camel_case_types
class PaginoMensagemSistema_confirm extends StatelessWidget {
  const PaginoMensagemSistema_confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 237, 182, 55),
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
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
                            //Mensagem: deseja sair do app?
                            WidgetTitulo(titulo: 'MENSAGEM SISTEMA'),
                            WidgetMensagemSis(
                              MensagemSis:
                                  'Voce deseja sair do app? \n O que deseja fazer?',
                            ),
                            //=====================================
                            //Botão: Continuar no App;
                            Widgetbuttom(
                              titulo: 'Continuar no app',
                              onTap: () => Navigator.of(context)
                                  .popUntil((route) => route.isFirst),
                            ),
                            //Botão: Sair;
                            Widgetbuttom(
                              titulo: 'Sair',
                              marginTop: 0,
                              onTap: () => {SystemNavigator.pop()},
                            ),
                            // =============================================
                          ])))),
                  const Widgetbottom()
                ],
              )),
        ),
      ),
    );
  }
}
