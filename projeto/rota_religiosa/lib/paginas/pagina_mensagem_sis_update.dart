import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_msg.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaginoMensagemSistemaUpdate extends StatelessWidget {
  bool erro;
  PaginoMensagemSistemaUpdate({super.key, this.erro = false});

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
                          WidgetTitulo(titulo: 'MENSAGEM SISTEMA'),
                          WidgetMensagemSis(
                            MensagemSis: !erro
                                ? 'Atualizado com SUCESSO \n O que deseja fazer?'
                                : 'Erro ao atualizar \n O que deseja fazer?',
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
            )),
      ),
    );
  }
}
