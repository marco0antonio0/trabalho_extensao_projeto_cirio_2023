import 'package:app_cirio/model/stream.dart';
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
      margin: EdgeInsets.only(bottom: 15),
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
          Spacer(flex: 25)
        ],
      ),
    );
  }
}

//=============================================================================================
// ignore: must_be_immutable
class WidgetRadioComponentMedicamento extends StatefulWidget {
  String titulo;
  WidgetRadioComponentMedicamento({super.key, this.titulo = ''});

  @override
  State<WidgetRadioComponentMedicamento> createState() =>
      _WidgetRadioComponentMedicamentoState();
}

class _WidgetRadioComponentMedicamentoState
    extends State<WidgetRadioComponentMedicamento> {
  StreamDados streamDados = StreamDados();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 15),
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
                                title: const Text("Medicamento 1",
                                    style: TextStyle(fontSize: 15)),
                                value: "Medicamento 1",
                                groupValue: streamDados.medicamento,
                                onChanged: (value) {
                                  streamDados.atualizarListaMedicamento(
                                      value.toString());
                                  setState(() {});
                                },
                              )),

                          //=======================================================
                          // Medicamento 2
                          Flexible(
                              flex: 100,
                              child: RadioListTile(
                                title: const Text("Medicamento 2",
                                    style: TextStyle(fontSize: 15)),
                                value: "Medicamento 2",
                                groupValue: streamDados.medicamento,
                                onChanged: (value) {
                                  streamDados.atualizarListaMedicamento(
                                      value.toString());
                                  setState(() {});
                                },
                              )),

                          //=======================================================
                          // Medicamento 3
                          Flexible(
                              flex: 100,
                              child: RadioListTile(
                                title: const Text("Medicamento 3",
                                    style: TextStyle(fontSize: 15)),
                                value: "Medicamento 3",
                                groupValue: streamDados.medicamento,
                                onChanged: (value) {
                                  streamDados.atualizarListaMedicamento(
                                      value.toString());
                                  setState(() {});
                                },
                              )),

                          //=======================================================
                        ],
                      ))
                ],
              )),
          Spacer(flex: 25)
        ],
      ),
    );
  }
}
