import 'package:app_cirio/components/widget_bottomBar.dart';
import 'package:app_cirio/components/widget_menu.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:app_cirio/controller/router_settings.dart';
import 'package:app_cirio/paginas/pagina_mensagem_sis_confirm.dart';
import 'package:flutter/material.dart';

class PaginoHome extends StatefulWidget {
  const PaginoHome({super.key});

  @override
  State<PaginoHome> createState() => _PaginoHomeState();
}

class _PaginoHomeState extends State<PaginoHome> {
  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          config_rota().animacao_2(context,
              novaPagina: const PaginoMensagemSistema_confirm());
          return false;
        },
        child: Scaffold(
            //Colocar um 'const' antes da função: color();
            backgroundColor: Color(0xffEBE9EC),
            body: Column(
              children: [
                Widgettopbar(
                  home: true,
                ),
                Expanded(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        // ignore: prefer_const_constructors
                        child: SingleChildScrollView(
                            // ignore: prefer_const_constructors
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: alturaTela > 750
                                    ? 40
                                    : alturaTela > 710
                                        ? 30
                                        : 10),
                            // =============================================
                            WidgetTitulo(titulo: 'INICIO'),
                            //==============================================
                            const Widgetmenu(),
                          ],
                        )))),
                //=======================================
                //Colocar um 'const' antes da função: Widgetbottom().
                Widgetbottom()
              ],
            )),
      ),
    );
  }
}
