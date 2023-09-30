import 'package:rota_religiosa/components/widget_bottomBar.dart';
import 'package:rota_religiosa/components/widget_buttom.dart';
import 'package:rota_religiosa/components/widget_msg.dart';
import 'package:rota_religiosa/components/widget_titulo.dart';
import 'package:rota_religiosa/components/widget_topbar.dart';
import 'package:rota_religiosa/controller/router_settings.dart';
import 'package:rota_religiosa/model/database.dart';
import 'package:rota_religiosa/model/getData.dart';
import 'package:rota_religiosa/model/stream.dart';
import 'package:rota_religiosa/paginas/pagina_mensagem_sis_export_mensage.dart';
import 'package:flutter/material.dart';

class PaginoMensagemSistemaExport extends StatefulWidget {
  const PaginoMensagemSistemaExport({super.key});

  @override
  State<PaginoMensagemSistemaExport> createState() =>
      _PaginoMensagemSistemaExportState();
}

class _PaginoMensagemSistemaExportState
    extends State<PaginoMensagemSistemaExport> {
  final dbHelper = DatabaseHelper();

  bool load = false;
  StreamDados streamDados = StreamDados();
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
                          // Componente titulo >>>> ' MENSAGEM SISTEMA '
                          WidgetTitulo(titulo: 'MENSAGEM SISTEMA'),
                          //=============================================
                          // Mensagem: 'Parabéns, o banco de dados esta pronto para ser enviado /nO que deseja fazer?
                          WidgetMensagemSis(
                            MensagemSis:
                                'Parabéns, o banco de dados esta pronto para ser enviado \nO que deseja fazer?',
                          ),
                          //=============================================
                          //        Botão de envio via servidor
                          load
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: const CircularProgressIndicator())
                              : Widgetbuttom(
                                  titulo: 'Enviar via Servidor',
                                  //====================================================
                                  //====================================================
                                  //====================================================
                                  onTap: () async {
                                    setState(() {
                                      load = true;
                                    });
                                    try {
                                      DateTime now = DateTime.now();
                                      String formattedDate =
                                          "${now.day}-${now.month}-${now.year}/${now.hour}:${now.minute}";
                                      List gen = [];
                                      dynamic data0 =
                                          await dbHelper.selectUser();
                                      dynamic data = await dbHelper
                                          .query('SELECT * FROM romeros');
                                      if (data.length > 0) {
                                        for (var i = 0; i < data.length; i++) {
                                          dynamic datax = {
                                            'pass': streamDados.data[0]['pass'],
                                            'dataTimeUpload': formattedDate,
                                            'idUsuario': data0[0]['idUsuario'],
                                            'nomeUsuario': data0[0]['nome'],
                                            'nome': data[i]['nome'],
                                            'idade': data[i]['idade'],
                                            'atendimento': data[i]
                                                ['atendimento'],
                                            'sexo': data[i]['sexo'],
                                            'distancia': data[i]['distancia']
                                          };
                                          gen.add(datax);
                                        }
                                        bool res =
                                            await sendDataToAPI(data: gen);
                                        if (res) {
                                          // ignore: use_build_context_synchronously
                                          config_rota().animacao_2(context,
                                              mode: false,
                                              novaPagina:
                                                  PaginoMensagemSistema_msg_export(
                                                      erro: false));
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          config_rota().animacao_2(context,
                                              mode: false,
                                              novaPagina:
                                                  PaginoMensagemSistema_msg_export(
                                                      erro: true));
                                        }
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        config_rota().animacao_2(context,
                                            mode: false,
                                            novaPagina:
                                                PaginoMensagemSistema_msg_export(
                                                    erro: true));
                                      }
                                    } catch (e) {
                                      // ignore: use_build_context_synchronously
                                      config_rota().animacao_2(context,
                                          mode: false,
                                          novaPagina:
                                              PaginoMensagemSistema_msg_export(
                                                  erro: true));
                                    }
                                  },
                                ),
                          //====================================================
                          //====================================================
                          //====================================================
                          // Botão: 'Voltar'
                          load
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  child: const CircularProgressIndicator())
                              : Widgetbuttom(
                                  titulo: 'Voltar',
                                  marginTop: 0,
                                  onTap: () => {Navigator.of(context).pop()},
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
