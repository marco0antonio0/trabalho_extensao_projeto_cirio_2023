import 'package:flutter/material.dart';
import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:rota_religiosa/controller/router_settings.dart';
import 'package:rota_religiosa/paginas/pagina_editar_perfil.dart';
import 'package:rota_religiosa/paginas/pagina_mensagem_sis_export.dart';

//====================================
//Stateless para página de configuração
class PaginoConfig extends StatelessWidget {
  const PaginoConfig({super.key});

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
                          // Componente Titulo 'CONFIGURAÇÃO'
                          WidgetTitulo(titulo: 'CONFIGURAÇÃO'),
                          //===================================
                          //Botão: 'Editar perfil';
                          Widgetbuttom(
                            titulo: 'Editar perfil',
                            onTap: () => {
                              config_rota().animacao_2(context,
                                  novaPagina: const PaginoEditarpefil())
                            },
                            //===========================================
                            // Botão: 'Exportar banco';
                          ),
                          Widgetbuttom(
                            titulo: 'Exporta banco',
                            marginTop: 0,
                            onTap: () => {
                              config_rota().animacao_2(context,
                                  novaPagina:
                                      const PaginoMensagemSistemaExport())
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
