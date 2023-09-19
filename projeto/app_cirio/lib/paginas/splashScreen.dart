import 'dart:async';

import 'package:app_cirio/controller/router_settings.dart';
import 'package:app_cirio/paginas/pagina_home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulando uma tarefa de inicialização, como carregamento de dados.
    // Aqui, estamos apenas aguardando por 3 segundos.
    Timer(const Duration(seconds: 4), () {
      // Após a tarefa de inicialização, navegue para a tela principal.
      config_rota()
          .animacao_2(context, mode: false, novaPagina: const PaginoHome());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          const Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                      flex: 100,
                      child: Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/appsplashImage.png'))),
                ],
              )),
          Expanded(
              flex: 1,
              child: Align(
                child: Container(
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
                          style: TextStyle(fontFamily: 'Kanit', fontSize: 20),
                        ),
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
