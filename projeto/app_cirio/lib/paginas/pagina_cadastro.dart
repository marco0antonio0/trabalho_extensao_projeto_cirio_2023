import 'package:app_cirio/components/widget_buttom.dart';
import 'package:app_cirio/components/widget_drop_buttom_component.dart';
import 'package:app_cirio/components/widget_input_component.dart';
import 'package:app_cirio/components/widget_radio_component.dart';
import 'package:app_cirio/components/widget_titulo.dart';
import 'package:app_cirio/components/widget_topbar.dart';
import 'package:app_cirio/controller/router_settings.dart';
import 'package:app_cirio/model/database.dart';
import 'package:app_cirio/model/stream.dart';
import 'package:app_cirio/paginas/pagina_mensagem_sis_cad.dart';
import 'package:flutter/material.dart';

class PaginaCadastro extends StatefulWidget {
  const PaginaCadastro({super.key});

  @override
  State<PaginaCadastro> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  TextEditingController nomeCampo = TextEditingController();
  TextEditingController idadeCampo = TextEditingController();
  TextEditingController distanciaCampo = TextEditingController();
  StreamDados streamDados = StreamDados();
  final dbHelper = DatabaseHelper();
  void initState() {
    super.initState();
    streamDados.atualizarcidade('');
    streamDados.atualizarOpSexo('');
    streamDados.atualizarListaMedicamento('');
    nomeCampo = TextEditingController(text: '');
    idadeCampo = TextEditingController(text: '');
    distanciaCampo = TextEditingController(text: '');
  }

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
                        // componente titulo de >>>> 'CADASTRO'
                        WidgetTitulo(
                          titulo: 'CADASTRO',
                          height: 75,
                        ),
                        // =============================================
                        // entrada de texto para o campo >>>> 'Nome'
                        WidgetInputComponent(
                          campo: nomeCampo,
                          titulo: 'Nome',
                          mode: TextInputType.name,
                        ),
                        // =============================================
                        // entrada de texto para o campo >>>>  'Idade'
                        WidgetInputComponent(
                          modeFormater: true,
                          campo: idadeCampo,
                          titulo: 'Idade',
                          mode: TextInputType.number,
                        ),
                        // =============================================
                        // entrada de texto para o campo >>>> 'Cidade de Origem'
                        WidgetDropComponent(
                          campo: distanciaCampo,
                          titulo: 'Cidade de Origem',
                        ),
                        // =============================================
                        // entrada de texto para o campo >>>> 'Medicamento'
                        WidgetRadioComponentMedicamento(
                          titulo: 'Medicamento',
                        ),
                        // =============================================
                        // entrada de texto para o campo >>>> 'Sexo'
                        WidgetRadioComponentSexo(
                          titulo: 'Sexo',
                        ),
                        // =============================================
                        // Botão de clique para outra pagina >>>>> 'Cadastrar'
                        Widgetbuttom(
                          titulo: 'Cadastrar',
                          onTap: () async {
                            if (nomeCampo.text.isNotEmpty &&
                                idadeCampo.text.isNotEmpty &&
                                streamDados.opSexo.isNotEmpty &&
                                streamDados.cidadex.isNotEmpty &&
                                streamDados.medicamento.isNotEmpty) {
                              try {
                                dynamic data = {
                                  'nome': nomeCampo.text,
                                  'idade': int.parse(idadeCampo.text),
                                  'medicamento': streamDados.medicamento,
                                  'sexo': streamDados.opSexo,
                                  'distancia': streamDados.cidadex
                                };
                                int result =
                                    await dbHelper.insertCad(data: data);
                                if (result != 0) {
                                  // ignore: use_build_context_synchronously
                                  config_rota().animacao_2(context,
                                      novaPagina: PaginoMensagemSistemaCad(
                                          error: false));
                                } else {
                                  // ignore: use_build_context_synchronously
                                  config_rota().animacao_2(context,
                                      novaPagina: PaginoMensagemSistemaCad(
                                          error: true));
                                }
                              } catch (e) {
                                // ignore: use_build_context_synchronously
                                config_rota().animacao_2(context,
                                    novaPagina: PaginoMensagemSistemaCad(
                                      error: true,
                                      error1: true,
                                    ));
                              }
                            }
                          },
                        ),
                        // =============================================
                      ]))))
            ],
          )),
    );
  }
}
