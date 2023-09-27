import 'package:rota_religiosa/controller/router_settings.dart';
import 'package:rota_religiosa/paginas/pagina_cadastro.dart';
import 'package:rota_religiosa/paginas/pagina_config.dart';
import 'package:rota_religiosa/paginas/pagina_consulta.dart';
import 'package:rota_religiosa/paginas/pagina_mensagem_sis_suporte.dart';
import 'package:flutter/material.dart';

//=======================================
//Componentes para página de menu
//=======================================

class Widgetmenu extends StatelessWidget {
  const Widgetmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 250,
      // color: Colors.green,
      child: Column(
        //=============================
        //Botões abaixo
        //=============================
        children: [
          Expanded(
              flex: 1,
              child: Row(children: [
                //============================
                // BTN 1
                BtnsMenu(
                  mode: true,
                  titulo: 'Cadastrar',
                  ontap: () => {
                    config_rota()
                        .animacao_2(context, novaPagina: const PaginaCadastro())
                  },
                ),
                //============================
                // BTN 2
                BtnsMenu(
                  titulo: 'Consulta',
                  ontap: () => {
                    config_rota()
                        .animacao_2(context, novaPagina: const PaginaConsulta())
                  },
                )
                //============================
              ])),
          Expanded(
              flex: 1,
              child: Row(children: [
                //============================
                // BTN 3
                BtnsMenu(
                  mode: true,
                  titulo: 'Configuração',
                  ontap: () => {
                    config_rota()
                        .animacao_2(context, novaPagina: const PaginoConfig())
                  },
                ),
                //============================
                // BTN 4
                BtnsMenu(
                  titulo: 'Sobre',
                  ontap: () => {
                    config_rota().animacao_2(context,
                        novaPagina: PaginoMensagemSistemaSobre())
                  },
                )
                //============================
              ])),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BtnsMenu extends StatelessWidget {
  bool mode = false;
  String titulo;
  dynamic ontap = () => {};
  BtnsMenu({super.key, this.mode = false, this.titulo = '', this.ontap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 100,
      child: InkWell(
        onTap: ontap,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25), // Cor da sombra
                offset: Offset(0, 4), // Deslocamento horizontal e vertical
                blurRadius: 4.0, // Raio de desfoque
                spreadRadius: 0.0, // Espalhamento da sombra
              ),
            ],
            color: const Color(0xffEDB637),
            borderRadius: mode
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))
                : const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
          ),
          child: Text(
            titulo,
            style: const TextStyle(
                fontFamily: 'Inter', color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
