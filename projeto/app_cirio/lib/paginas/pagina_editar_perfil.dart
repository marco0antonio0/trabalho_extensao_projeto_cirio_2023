import 'package:app_cirio/components/widget_buttom.dart';
import 'package:app_cirio/components/widget_input_component.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:app_cirio/controller/router_settings.dart';
import 'package:app_cirio/paginas/pagina_mensagem_sis_update.dart';
import 'package:flutter/material.dart';

class PaginoEditarpefil extends StatefulWidget {
  const PaginoEditarpefil({super.key});

  @override
  State<PaginoEditarpefil> createState() => _PaginoEditarpefilState();
}

class _PaginoEditarpefilState extends State<PaginoEditarpefil> {
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
                //========================================
                // Componente Titulo 'EDITAR PERFIL'
                WidgetTitulo(titulo: 'EDITAR PERFIL'),
                //========================================
                //entrada de texto para alteração do campo >>>> 'Nome'
                WidgetInputComponent(
                  campo: nomeCampo,
                  titulo: 'Nome',
                  mode: TextInputType.text,
                ),
                //========================================
                //entrada de texto para alteração do campo >>>> 'Telefone'
                WidgetInputComponent(
                  campo: telefoneCampo,
                  titulo: 'Telefone',
                  mode: TextInputType.phone,
                ),
                //========================================
                //entrada de texto para alteração do campo >>>> 'Bloco'
                WidgetInputComponent(
                  campo: blocoCampo,
                  titulo: 'Bloco',
                  mode: TextInputType.text,
                ),
                //========================================
                // Botão de clique para outra pagina >>>>> 'Atualizar'
                Widgetbuttom(
                  titulo: 'Atualizar',
                  onTap: () => {
                    config_rota().animacao_2(context,
                        mode: false, novaPagina: PaginoMensagemSistemaUpdate())
                  },
                ),
              ],
            ),
          )),
    );
  }
}
