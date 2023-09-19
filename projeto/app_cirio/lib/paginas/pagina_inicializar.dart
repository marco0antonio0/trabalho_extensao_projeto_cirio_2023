import 'package:app_cirio/components/widget_buttom.dart';
import 'package:app_cirio/components/widget_input_component.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:app_cirio/controller/router_settings.dart';
import 'package:app_cirio/paginas/pagina_home.dart';
import 'package:flutter/material.dart';

//==============================================
//StatefulWidget para a página de primeiro acesso do usuário.
class PaginoInicializar extends StatefulWidget {
  const PaginoInicializar({super.key});

  @override
  State<PaginoInicializar> createState() => _PaginoInicializarState();
}

class _PaginoInicializarState extends State<PaginoInicializar> {
  TextEditingController nomeCampo = TextEditingController();
  TextEditingController telefoneCampo = TextEditingController();
  TextEditingController blocoCampo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffEBE9EC),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Widgettopbar(),
                Widgettopbar(),
                //============================================
                // Componente Titulo 'PRIMEIRO ACESSO'
                WidgetTitulo(titulo: 'PRIMEIRO ACESSO'),
                //============================================
                // entrada de texto para o campo >>>> 'Nome'
                WidgetInputComponent(
                  campo: nomeCampo,
                  titulo: 'Nome',
                  mode: TextInputType.text,
                ),
                //============================================
                //entrada de texto para o campo >>>> 'Telefone'
                WidgetInputComponent(
                  campo: telefoneCampo,
                  titulo: 'Telefone',
                  mode: TextInputType.phone,
                ),
                //============================================
                //entrada de texto para o campo >>>> 'Bloco'
                WidgetInputComponent(
                  campo: blocoCampo,
                  titulo: 'Bloco',
                  mode: TextInputType.text,
                ),
                //============================================
                // Botão de clique para outra pagina >>>>> 'Iniciar app'
                Widgetbuttom(
                  titulo: 'Iniciar app',
                  onTap: () => {
                    config_rota().animacao_2(context,
                        mode: false, novaPagina: const PaginoHome())
                  },
                ),
              ],
            ),
          )),
    );
  }
}
