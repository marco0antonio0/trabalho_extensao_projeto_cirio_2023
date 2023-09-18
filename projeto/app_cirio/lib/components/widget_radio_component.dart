import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetRadioComponentSexo extends StatefulWidget {
  String titulo;
  WidgetRadioComponentSexo({super.key, this.titulo = ''});

  @override
  State<WidgetRadioComponentSexo> createState() =>
      _WidgetRadioComponentSexoState();
}

class _WidgetRadioComponentSexoState extends State<WidgetRadioComponentSexo> {
  String? gender;
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
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
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
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
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
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
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
  String? med;
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
                                groupValue: med,
                                onChanged: (value) {
                                  setState(() {
                                    med = value.toString();
                                  });
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
                                groupValue: med,
                                onChanged: (value) {
                                  setState(() {
                                    med = value.toString();
                                  });
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
                                groupValue: med,
                                onChanged: (value) {
                                  setState(() {
                                    med = value.toString();
                                  });
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
