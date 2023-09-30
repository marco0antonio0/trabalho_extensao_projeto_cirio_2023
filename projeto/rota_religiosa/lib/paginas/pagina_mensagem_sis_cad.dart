import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_msg.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaginoMensagemSistemaCad extends StatelessWidget {
  bool error;
  bool error1;
  PaginoMensagemSistemaCad(
      {super.key, this.error = false, this.error1 = false});

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
                            // Componente titulo >>>>> 'MENSAGEM SISTEMA'
                            WidgetTitulo(titulo: 'MENSAGEM SISTEMA'),
                            WidgetMensagemSis(
                              MensagemSis: !error || !error1
                                  ? 'Cadastro efetuado com SUCESSO! \n O que deseja fazer?'
                                  : !error1
                                      ? 'Erro ao realizar o cadastro! \n O que deseja fazer?'
                                      : 'Erro ao realizar o cadastro\n variavel de entrada não permitida! \n O que deseja fazer?',
                            ),
                            // //=============================================<<<<<<<<<<<< desabilitado por questões de erros recorrentes
                            // // Botão para 'Cad Novamente' ou 'tentar novamente'
                            // Widgetbuttom(
                            //   titulo:
                            //       !error1 ? 'Cad Novamente' : "tentar novamente",
                            //   onTap: () => {Navigator.of(context).pop()},
                            // ),
                            //=============================================
                            //Botão de clique para outra pagina >>>>> 'Ir para o menu'
                            Widgetbuttom(
                              titulo: 'Ir para o menu',
                              marginTop: 0,
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
