import 'package:flutter/material.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_input_component.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:rota_religiosa/controller/router_settings.dart';
import 'package:rota_religiosa/model/database.dart';
import 'package:rota_religiosa/model/stream.dart';
import 'package:rota_religiosa/paginas/pagina_mensagem_sis_update.dart';

class PaginoEditarpefil extends StatefulWidget {
  const PaginoEditarpefil({super.key});

  @override
  State<PaginoEditarpefil> createState() => _PaginoEditarpefilState();
}

class _PaginoEditarpefilState extends State<PaginoEditarpefil> {
  TextEditingController nomeCampo = TextEditingController();
  TextEditingController idnomeCampo = TextEditingController();
  TextEditingController telefoneCampo = TextEditingController();
  TextEditingController blocoCampo = TextEditingController();
  TextEditingController passWordServerCampo = TextEditingController();
  StreamDados streamDados = StreamDados();
  // @override
  @override
  initState() {
    super.initState();
    nomeCampo = TextEditingController(text: streamDados.data[0]['nome']);
    idnomeCampo = TextEditingController(text: streamDados.data[0]['idUsuario']);
    telefoneCampo =
        TextEditingController(text: streamDados.data[0]['telefone'].toString());
    blocoCampo = TextEditingController(text: streamDados.data[0]['bloco']);
    passWordServerCampo =
        TextEditingController(text: streamDados.data[0]['pass']);
  }

  final dbHelper = DatabaseHelper();
  bool erro = false;
  String? erroMensagem;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 237, 182, 55),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffEBE9EC),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Widgettopbar(),
                  //========================================
                  // Componente Titulo 'EDITAR PERFIL'
                  WidgetTitulo(titulo: 'EDITAR PERFIL'),
                  //========================================
                  //entrada de texto para alteração do campo >>>> 'idnome'
                  WidgetInputComponent(
                    isDisable: true,
                    campo: idnomeCampo,
                    titulo: 'ID fixo',
                    mode: TextInputType.text,
                  ),
                  //========================================
                  //entrada de texto para alteração do campo >>>> 'Nome'
                  WidgetInputComponent(
                    campo: nomeCampo,
                    titulo: 'Email',
                    mode: TextInputType.emailAddress,
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
                  WidgetInputComponent(
                    // password: true,s
                    campo: passWordServerCampo,
                    titulo: 'senha servidor',
                    mode: TextInputType.text,
                  ),
                  erro
                      ? Text(
                          erroMensagem!,
                          style: const TextStyle(color: Colors.red),
                        )
                      : Container(),
                  //========================================
                  // Botão de clique para outra pagina >>>>> 'Atualizar'
                  Widgetbuttom(
                      titulo: 'Atualizar',
                      onTap: () async {
                        if (nomeCampo.text.isNotEmpty &&
                            telefoneCampo.text.isNotEmpty &&
                            blocoCampo.text.isNotEmpty &&
                            passWordServerCampo.text.isNotEmpty) {
                          dynamic y = await dbHelper.selectUser();
                          dynamic data = {
                            'id': streamDados.data[0]['id'],
                            'nome': nomeCampo.text,
                            'telefone': int.parse(telefoneCampo.text),
                            'bloco': blocoCampo.text,
                            'idUsuario': y[0]['idUsuario'],
                            'pass': passWordServerCampo.text
                          };
                          dynamic x = await dbHelper.updateUser(data: data);

                          if (x != 0) {
                            streamDados.atualizardata([data]);
                            // ignore: use_build_context_synchronously
                            config_rota().animacao_2(context,
                                mode: false,
                                novaPagina: PaginoMensagemSistemaUpdate());
                          } else {
                            setState(() {
                              erro = true;
                              erroMensagem =
                                  'erro ao atualizar seu dados\nse persistir contate o suporte ';
                            });
                          }
                        } else {
                          setState(() {
                            erro = true;
                            erroMensagem =
                                'preencha todos os campos \npara atualizar os dados';
                          });
                        }
                      }),
                  // const Widgetbottom()
                ],
              ),
            )),
      ),
    );
  }
}
