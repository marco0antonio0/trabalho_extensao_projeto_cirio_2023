import 'package:app_cirio/components/widget_buttom.dart';
import 'package:app_cirio/components/widget_drop_buttom_component.dart';
import 'package:app_cirio/components/widget_input_component.dart';
import 'package:app_cirio/components/widget_radio_component.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:app_cirio/controller/router_settings.dart';
import 'package:app_cirio/model/database.dart';
import 'package:app_cirio/model/stream.dart';
import 'package:app_cirio/paginas/pagina_mensagem_sis_delete.dart';
import 'package:app_cirio/paginas/pagina_mensagem_sis_update.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaginaUpdateCadastro extends StatefulWidget {
  Map<String, dynamic> data;
  PaginaUpdateCadastro({super.key, required this.data});

  @override
  State<PaginaUpdateCadastro> createState() =>
      // ignore: no_logic_in_create_state
      _PaginaUpdateCadastroState(data: data);
}

class _PaginaUpdateCadastroState extends State<PaginaUpdateCadastro> {
  Map<String, dynamic> data;
  _PaginaUpdateCadastroState({required this.data});
  TextEditingController nomeCampo = TextEditingController();
  TextEditingController idadeCampo = TextEditingController();
  TextEditingController distanciaCampo = TextEditingController();
  StreamDados streamDados = StreamDados();

  @override
  void initState() {
    super.initState();

    nomeCampo.text = data["nome"];
    idadeCampo.text = data["idade"].toString();
    streamDados.atualizarcidade('');
    // streamDados.atualizarcidade(data['distancia']);
    streamDados.atualizarListaMedicamento(data['medicamento']);
    streamDados.atualizarOpSexo(data['sexo']);
    setState(() {});
  }

  final dbHelper = DatabaseHelper();

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
                        //==============================================
                        // entrada de texto para o campo >>>>  Nome
                        WidgetInputComponent(
                          campo: nomeCampo,
                          titulo: 'Nome',
                          mode: TextInputType.name,
                        ),
                        //==============================================
                        //entrada de texto para o campo >>>>  idade
                        WidgetInputComponent(
                          modeFormater: true,
                          campo: idadeCampo,
                          titulo: 'Idade',
                          mode: TextInputType.number,
                        ),
                        //==============================================
                        // cidade de origem >>>> distancia percorrida
                        WidgetDropComponent(
                          campo: distanciaCampo,
                          value: data["distancia"],
                          titulo: 'Cidade de Origem',
                        ),
                        //================================================
                        // medicamento >>> sim >>>> não
                        WidgetRadioComponentMedicamento(
                          titulo: 'Medicamento',
                        ),
                        //================================================
                        // sexo >>> feminio >>> masculino >>>
                        WidgetRadioComponentSexo(
                          titulo: 'Sexo',
                        ),
                        //================================================
                        // buttom >> ações ao serem executadas
                        Widgetbuttom(
                          titulo: 'Atualizar',
                          onTap: () async {
                            if (nomeCampo.text.isNotEmpty &&
                                idadeCampo.text.isNotEmpty &&
                                streamDados.opSexo.isNotEmpty &&
                                streamDados.medicamento.isNotEmpty) {
                              dynamic datax = {
                                'nome': nomeCampo.text,
                                'idade': int.parse(idadeCampo.text),
                                'medicamento': streamDados.medicamento,
                                'sexo': streamDados.opSexo,
                                'distancia': streamDados.cidadex.isEmpty
                                    ? data['distancia']
                                    : streamDados.cidadex,
                                'id': data['id']
                              };
                              int result =
                                  await dbHelper.updateCad(data: datax);

                              if (result != 0) {
                                // ignore: use_build_context_synchronously
                                config_rota().animacao_2(context,
                                    novaPagina: PaginoMensagemSistemaUpdate(
                                        erro: false));
                              } else {
                                // ignore: use_build_context_synchronously
                                config_rota().animacao_2(context,
                                    novaPagina: PaginoMensagemSistemaUpdate(
                                        erro: true));
                              }
                            }
                            // config_rota().animacao_2(context,
                            //     novaPagina: const PaginoMensagemSistemaUpdate())
                          },
                        ),
                        // =============================================
                        Widgetbuttom(
                          titulo: 'Deletar',
                          marginTop: 0,
                          onTap: () async {
                            try {
                              int results =
                                  await dbHelper.deleteCad(id: data['id']);
                              if (results != 0) {
                                // ignore: use_build_context_synchronously
                                config_rota().animacao_2(context,
                                    novaPagina: PaginoMensagemSistemaDelete(
                                        erro: false));
                              } else {
                                // ignore: use_build_context_synchronously
                                config_rota().animacao_2(context,
                                    novaPagina: PaginoMensagemSistemaDelete(
                                        erro: true));
                              }
                            } catch (e) {
                              // ignore: use_build_context_synchronously
                              config_rota().animacao_2(context,
                                  novaPagina:
                                      PaginoMensagemSistemaDelete(erro: true));
                            }
                          },
                        )
                      ]))))
            ],
          )),
    );
  }
}
