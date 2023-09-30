import 'package:rota_religiosa/model/stream.dart';
import 'package:flutter/material.dart';

//====================================
//Componentes para seleção de radio
//====================================

// ignore: must_be_immutable
class WidgetRadioComponentSexo extends StatefulWidget {
  String titulo;
  WidgetRadioComponentSexo({super.key, this.titulo = ''});

  @override
  State<WidgetRadioComponentSexo> createState() =>
      _WidgetRadioComponentSexoState();
}

class _WidgetRadioComponentSexoState extends State<WidgetRadioComponentSexo> {
  StreamDados streamDados = StreamDados();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          const Spacer(flex: 15),
          Expanded(
              flex: 30,
              child: Column(
                children: [
                  // margem
                  Expanded(flex: 50, child: Container()),
                  // icone santinha
                  Expanded(
                      flex: 100, child: Container(alignment: Alignment.center)),
                ],
              )),
          Expanded(
              flex: 150,
              child: Column(
                children: [
                  Expanded(
                      flex: 30,
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.titulo,
                            style: const TextStyle(fontFamily: 'Kanit'),
                          ))),
                  // text titulo
                  Expanded(
                      flex: 150,
                      child: Column(
                        children: [
                          //=======================================================
                          // sexo feminino
                          Flexible(
                              flex: 100,
                              child: RadioListTile(
                                title: const Text("Feminino",
                                    style: TextStyle(fontSize: 15)),
                                value: "Feminino",
                                groupValue: streamDados.opSexo,
                                onChanged: (value) {
                                  streamDados.atualizarOpSexo(value.toString());
                                  setState(() {});
                                },
                              )),
                          //===================================================
                          // sexo masculino
                          Flexible(
                              flex: 100,
                              child: RadioListTile(
                                title: const Text("Masculino",
                                    style: TextStyle(fontSize: 15)),
                                value: "Masculino",
                                groupValue: streamDados.opSexo,
                                onChanged: (value) {
                                  streamDados.atualizarOpSexo(value.toString());
                                  setState(() {});
                                },
                              )),
                          //=======================================================
                          // sexo Outros
                          Flexible(
                              flex: 100,
                              child: RadioListTile(
                                title: const Text(
                                  "Outros",
                                  style: TextStyle(fontSize: 15),
                                ),
                                value: "Outros",
                                groupValue: streamDados.opSexo,
                                onChanged: (value) {
                                  streamDados.atualizarOpSexo(value.toString());
                                  setState(() {});
                                },
                              )),
                          //=======================================================
                        ],
                      ))
                ],
              )),
          const Spacer(flex: 25)
        ],
      ),
    );
  }
}

//=============================================================================================
// ignore: must_be_immutable
class WidgetRadioComponentAtendimento extends StatefulWidget {
  String titulo;
  WidgetRadioComponentAtendimento({super.key, this.titulo = ''});

  @override
  State<WidgetRadioComponentAtendimento> createState() =>
      _WidgetRadioComponentAtendimentoState();
}

class _WidgetRadioComponentAtendimentoState
    extends State<WidgetRadioComponentAtendimento> {
  StreamDados streamDados = StreamDados();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          const Spacer(flex: 15),
          Expanded(
              flex: 30,
              child: Column(
                children: [
                  // margem
                  Expanded(flex: 50, child: Container()),
                  // icone santinha
                  Expanded(
                      flex: 100, child: Container(alignment: Alignment.center)),
                ],
              )),
          Expanded(
              flex: 150,
              child: Column(
                children: [
                  Expanded(
                      flex: 30,
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.titulo,
                            style: const TextStyle(fontFamily: 'Kanit'),
                          ))),
                  // text titulo
                  Expanded(
                      flex: 150,
                      child: Column(
                        children: [
                          //=======================================================
                          // Medicamento 1
                          Flexible(
                              flex: 100,
                              child: RadioListTile(
                                title: const Text("Casa de placido",
                                    style: TextStyle(fontSize: 15)),
                                value: "Casa de placido",
                                groupValue: streamDados.atendimento,
                                onChanged: (value) {
                                  streamDados.atualizarListaAtendimento(
                                      value.toString());
                                  setState(() {});
                                },
                              )),

                          //=======================================================
                          // Atendimento 2
                          Flexible(
                              flex: 100,
                              child: RadioListTile(
                                title: const Text("Tribunal",
                                    style: TextStyle(fontSize: 15)),
                                value: "Tribunal",
                                groupValue: streamDados.atendimento,
                                onChanged: (value) {
                                  streamDados.atualizarListaAtendimento(
                                      value.toString());
                                  setState(() {});
                                },
                              )),

                          //=======================================================
                          // Atendido 3
                          Flexible(
                              flex: 100,
                              child: RadioListTile(
                                title: const Text("Atendido nos dois",
                                    style: TextStyle(fontSize: 15)),
                                value: "Atendido nos dois",
                                groupValue: streamDados.atendimento,
                                onChanged: (value) {
                                  streamDados.atualizarListaAtendimento(
                                      value.toString());
                                  setState(() {});
                                },
                              )),
                          //=======================================================
                          // Atendido 4
                          Flexible(
                              flex: 100,
                              child: RadioListTile(
                                title: const Text("Negou ser atendido",
                                    style: TextStyle(fontSize: 15)),
                                value: "Negou ser atendido",
                                groupValue: streamDados.atendimento,
                                onChanged: (value) {
                                  streamDados.atualizarListaAtendimento(
                                      value.toString());
                                  setState(() {});
                                },
                              )),
                        ],
                      ))
                ],
              )),
          const Spacer(flex: 25)
        ],
      ),
    );
  }
}
