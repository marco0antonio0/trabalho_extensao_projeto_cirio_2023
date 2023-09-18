import 'package:app_cirio/components/widget_buttom.dart';
import 'package:app_cirio/components/widget_input_component.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:app_cirio/paginas/pagina_mensagem_sis_update.dart';
import 'package:flutter/material.dart';

class PaginoEditarpefil extends StatelessWidget {
  const PaginoEditarpefil({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffEBE9EC),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Widgettopbar(),
                WidgetTitulo(titulo: 'EDITAR PERFIL'),
                WidgetInputComponent(
                  titulo: 'Nome',
                ),
                WidgetInputComponent(
                  titulo: 'Telefone',
                ),
                WidgetInputComponent(
                  titulo: 'Bloco',
                ),
                Widgetbuttom(
                  titulo: 'Atualizar',
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => PaginoMensagemSistemaUpdate()))
                  },
                ),
              ],
            ),
          )),
    );
  }
}
