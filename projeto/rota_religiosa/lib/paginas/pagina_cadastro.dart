import 'package:flutter/material.dart';
import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_drop_buttom_component.dart';
import 'package:rota_religiosa/components/widget_input_component.dart';
import 'package:rota_religiosa/components/widget_radio_component.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:rota_religiosa/controller/router_settings.dart';
import 'package:rota_religiosa/model/database.dart';
import 'package:rota_religiosa/model/stream.dart';
import 'package:rota_religiosa/paginas/pagina_mensagem_sis_cad.dart';

//==============================
//StatefulWidget da página de Cadastro
class PaginaCadastro extends StatefulWidget {
  const PaginaCadastro({super.key});
//=====================================
//
  @override
  State<PaginaCadastro> createState() => _PaginaCadastroState();
}

//===================================
//Formulários de cadastro
class _PaginaCadastroState extends State<PaginaCadastro> {
  TextEditingController nomeCampo = TextEditingController();
  TextEditingController idadeCampo = TextEditingController();
  TextEditingController distanciaCampo = TextEditingController();
  StreamDados streamDados = StreamDados();
  final dbHelper = DatabaseHelper();
  @override
  void initState() {
    super.initState();
    streamDados.atualizarcidade('');
    streamDados.atualizarOpSexo('');
    streamDados.atualizarListaAtendimento('');
    nomeCampo = TextEditingController(text: '');
    idadeCampo = TextEditingController(text: '');
  }

  bool erro = false;
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
                          // componente titulo de >>>> 'CADASTRO'
                          WidgetTitulo(
                            titulo: 'CADASTRO',
                            height: 75,
                          ),
                          // =============================================
                          // entrada de texto para o campo >>>> 'Nome'
                          WidgetInputComponent(
                            campo: nomeCampo,
                            titulo: 'Nome completo',
                            mode: TextInputType.name,
                          ),
                          // =============================================
                          // entrada de texto para o campo >>>>  'Idade'
                          WidgetInputComponent(
                            idade: true,
                            modeFormater: true,
                            campo: idadeCampo,
                            titulo: 'Idade',
                            mode: TextInputType.number,
                          ),
                          // =============================================
                          // entrada de texto para o campo >>>> 'origem de partida'
                          WidgetDropComponent(
                            campo: distanciaCampo,
                            titulo: 'Cidade de Origem',
                          ),
                          // =============================================
                          // entrada de texto para o campo >>>> 'Medicamento'
                          WidgetRadioComponentAtendimento(
                            titulo: 'Atendimento',
                          ),
                          // =============================================
                          // entrada de texto para o campo >>>> 'Sexo'
                          WidgetRadioComponentSexo(
                            titulo: 'Sexo',
                          ),
                          !erro
                              ? Container()
                              : Container(
                                  margin:
                                      const EdgeInsets.only(top: 18, bottom: 4),
                                  child: const Text(
                                    'preencha todos os campos',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 17),
                                  )),
                          // =============================================
                          // Botão de clique para outra pagina >>>>> 'Cadastrar'
                          Widgetbuttom(
                            titulo: 'Cadastrar',
                            onTap: () async {
                              if (nomeCampo.text.isNotEmpty &&
                                  idadeCampo.text.isNotEmpty &&
                                  streamDados.opSexo.isNotEmpty &&
                                  streamDados.cidadex.isNotEmpty &&
                                  streamDados.atendimento.isNotEmpty) {
                                try {
                                  dynamic data = {
                                    'nome': nomeCampo.text,
                                    'idade': int.parse(idadeCampo.text),
                                    'atendimento': streamDados.atendimento,
                                    'sexo': streamDados.opSexo,
                                    'distancia': streamDados.cidadex
                                  };
                                  int result =
                                      await dbHelper.insertCad(data: data);
                                  if (result != 0) {
                                    // nomeCampo.clear();
                                    // idadeCampo.clear();
                                    // streamDados.atualizarOpSexo('');
                                    // streamDados.atualizarcidade('');
                                    // streamDados.atualizarListaAtendimento('');
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
                              } else {
                                setState(() {
                                  erro = true;
                                });
                              }
                            },
                          ),
                          const Widgetbottom()
                          // =============================================
                        ]))))
              ],
            )),
      ),
    );
  }
}
