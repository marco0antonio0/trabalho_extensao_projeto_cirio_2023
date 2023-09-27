// ignore_for_file: file_names

import 'dart:async';
import 'package:rota_religiosa/controller/router_settings.dart';
import 'package:rota_religiosa/controller/solicitaPermissao.dart';
import 'package:rota_religiosa/model/database.dart';
import 'package:rota_religiosa/model/stream.dart';
import 'package:rota_religiosa/paginas/pagina_home.dart';
import 'package:rota_religiosa/paginas/pagina_primeira_inicializacao.dart';
import 'package:flutter/material.dart';

class SplashLoad extends StatefulWidget {
  const SplashLoad({super.key});

  @override
  State<SplashLoad> createState() => _SplashLoadState();
}

class _SplashLoadState extends State<SplashLoad> {
  final dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    requestStoragePermission(context, () => {});
  }

  StreamDados streamDados = StreamDados();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          const Column(children: [
            Expanded(
                flex: 1,
                child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/appsplashImage.png'))),
          ]),
          Align(
              alignment: const Alignment(0, -0.2),
              child: FutureBuilder(
                future: dbHelper.selectUser(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // ignore: avoid_print
                    if (snapshot.data.isEmpty) {
                      Future.delayed(const Duration(seconds: 6), () {
                        config_rota().animacao_2(context,
                            mode: false,
                            novaPagina: const PaginaPrimeiraInicializacao());
                      });
                    } else {
                      streamDados.atualizardata(snapshot.data);
                      Future.delayed(const Duration(seconds: 6), () {
                        config_rota().animacao_2(context,
                            mode: false, novaPagina: const PaginoHome());
                      });
                    }
                    return Container(
                      color: Colors.white.withOpacity(0.9),
                      height: 300,
                      width: MediaQuery.of(context).size.width * 0.8,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: const Text(
                              'Iniciando app',
                              style: TextStyle(
                                fontFamily: 'Kanit',
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const CircularProgressIndicator(),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )),
          Align(
              alignment: const Alignment(0, 0.7),
              child: Container(
                  color: Colors.white.withOpacity(0.9),
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Projeto de extensão',
                            style:
                                TextStyle(fontFamily: 'Kanit', fontSize: 20)),
                        SizedBox(
                            height: 70,
                            width: 70,
                            child: Image(
                                image:
                                    AssetImage('assets/icons/icon_unama.png'))),
                        Text('Faculdade Unama',
                            style:
                                TextStyle(fontFamily: 'Kanit', fontSize: 20)),
                      ]))),
        ],
      )),
    );
  }
}
