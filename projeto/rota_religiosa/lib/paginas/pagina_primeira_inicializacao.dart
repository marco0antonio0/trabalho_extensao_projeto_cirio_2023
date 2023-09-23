import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_input_component.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:rota_religiosa/controller/router_settings.dart';
import 'package:rota_religiosa/model/database.dart';
import 'package:rota_religiosa/model/stream.dart';
import 'package:rota_religiosa/paginas/pagina_home.dart';
import 'package:flutter/material.dart';

class PaginaPrimeiraInicializacao extends StatefulWidget {
  const PaginaPrimeiraInicializacao({super.key});

  @override
  State<PaginaPrimeiraInicializacao> createState() =>
      _PaginaPrimeiraInicializacaoState();
}

class _PaginaPrimeiraInicializacaoState
    extends State<PaginaPrimeiraInicializacao> {
  TextEditingController nomeCampo = TextEditingController();
  TextEditingController telefoneCampo = TextEditingController();
  TextEditingController blocoCampo = TextEditingController();
  final dbHelper = DatabaseHelper();
  StreamDados streamDados = StreamDados();
  bool erro = false;
  String? erroMensagem;
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
                WidgetTitulo(titulo: 'Ola seja bem vindo(a)'),
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
                erro
                    ? Container(
                        child: Text(erroMensagem!),
                      )
                    : Container(),
                //========================================
                // Botão de clique para outra pagina >>>>> 'Atualizar'
                Widgetbuttom(
                  titulo: 'Iniciar app',
                  onTap: () async {
                    if (nomeCampo.text.isNotEmpty &&
                        telefoneCampo.text.isNotEmpty &&
                        blocoCampo.text.isNotEmpty) {
                      dynamic data = {
                        'idUsuario': nomeCampo.text,
                        'nome': nomeCampo.text,
                        'telefone': int.parse(telefoneCampo.text),
                        'bloco': blocoCampo.text
                      };
                      int x = await dbHelper.insertUser(data: data);
                      if (x != 0) {
                        dynamic y = await dbHelper.selectUser();
                        streamDados.atualizardata(y);
                        // ignore: use_build_context_synchronously
                        config_rota().animacao_2(context,
                            mode: false, novaPagina: const PaginoHome());
                      } else {
                        setState(() {
                          erro = true;
                          erroMensagem =
                              'erro ao inicializar seu cadastro\ncontate o suporte ';
                        });
                      }
                    } else {
                      setState(() {
                        erro = true;
                        erroMensagem =
                            'preencha todos os campos \npara inicializar o app';
                      });
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
