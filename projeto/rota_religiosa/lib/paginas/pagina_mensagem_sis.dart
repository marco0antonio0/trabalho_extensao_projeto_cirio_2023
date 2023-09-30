import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_msg.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:rota_religiosa/controller/router_settings.dart';
import 'package:rota_religiosa/paginas/pagina_home.dart';
import 'package:flutter/material.dart';

class PaginoMensagemSistema extends StatelessWidget {
  const PaginoMensagemSistema({super.key});

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
                            MensagemSis:
                                'Cadastro efetuado com SUCESSO! \n O que deseja fazer?',
                          ),
                          Widgetbuttom(
                            titulo: 'Cad Novamente',
                            onTap: () => {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => PaginoEditarpefil()))
                            },
                          ),
                          Widgetbuttom(
                            titulo: 'Ir ara o menu',
                            marginTop: 0,
                            onTap: () => {
                              config_rota().animacao_2(context,
                                  mode: false, novaPagina: const PaginoHome())
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => PaginoEditarpefil()))
                            },
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
