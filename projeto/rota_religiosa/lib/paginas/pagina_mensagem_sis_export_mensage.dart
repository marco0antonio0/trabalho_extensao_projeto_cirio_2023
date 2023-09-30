import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_msg.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class PaginoMensagemSistema_msg_export extends StatelessWidget {
  bool erro;
  PaginoMensagemSistema_msg_export({super.key, this.erro = false});
  // ignore: unused_element

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
                            erro: erro,
                            MensagemSis: !erro
                                ? 'envio efetuado com SUCESSO! \n O que deseja fazer?'
                                : 'erro ao realizar envio\n Caso o erro persista contate o suporte whatsapp 91 984837847 \n O que deseja fazer?',
                          ),
                          Widgetbuttom(
                              titulo: 'ir para menu',
                              onTap: () => {
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst)
                                  }),
                        ])))),
                const Widgetbottom()
              ],
            )),
      ),
    );
  }
}
