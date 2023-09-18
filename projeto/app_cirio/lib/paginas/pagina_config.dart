import 'package:app_cirio/components/widget_bottomBar.dart';
import 'package:app_cirio/components/widget_buttom.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:app_cirio/paginas/pagina_editar_perfil.dart';
import 'package:app_cirio/paginas/pagina_mensagem_sis_export.dart';
import 'package:flutter/material.dart';

class PaginoConfig extends StatelessWidget {
  const PaginoConfig({super.key});

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
                        WidgetTitulo(titulo: 'CONFIGURAÇÃO'),

                        Widgetbuttom(
                          titulo: 'Editar perfil',
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PaginoEditarpefil()))
                          },
                          //
                        ),
                        Widgetbuttom(
                          titulo: 'Exporta banco',
                          marginTop: 0,
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PaginoMensagemSistemaExport()))
                          },
                        ),
                        // =============================================
                      ])))),
              Widgetbottom()
            ],
          )),
    );
  }
}
