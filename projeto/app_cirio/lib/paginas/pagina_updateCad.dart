import 'package:app_cirio/components/widget_buttom.dart';
import 'package:app_cirio/components/widget_input_component.dart';
import 'package:app_cirio/components/widget_radio_component.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:app_cirio/paginas/pagina_mensagem_sis_update.dart';
import 'package:flutter/material.dart';

class PaginaUpdateCadastro extends StatelessWidget {
  const PaginaUpdateCadastro({super.key});

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
                        WidgetTitulo(
                          titulo: 'CADASTRADO',
                          height: 75,
                        ),
                        WidgetInputComponent(
                          titulo: 'Nome',
                        ),
                        WidgetInputComponent(
                          titulo: 'Idade',
                        ),
                        WidgetInputComponent(
                          titulo: 'Cidade de Origem',
                        ),
                        WidgetRadioComponentMedicamento(
                          titulo: 'Medicamento',
                        ),
                        WidgetRadioComponentSexo(
                          titulo: 'Sexo',
                        ),
                        Widgetbuttom(
                          titulo: 'Atualizar',
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PaginoMensagemSistemaUpdate()))
                          },
                        ),
                        // =============================================
                      ]))))
            ],
          )),
    );
  }
}
