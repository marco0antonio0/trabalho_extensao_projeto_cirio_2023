import 'package:rota_religiosa/controller/router_settings.dart';
import 'package:rota_religiosa/model/database.dart';
import 'package:rota_religiosa/paginas/pagina_updateCad.dart';
import 'package:flutter/material.dart';

class ColunaDeCadastrados extends StatefulWidget {
  const ColunaDeCadastrados({super.key});

  @override
  State<ColunaDeCadastrados> createState() => _ColunaDeCadastradosState();
}

//================================
//Widget para coluna de cadastrados
//================================
class _ColunaDeCadastradosState extends State<ColunaDeCadastrados> {
  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dbHelper.query('SELECT * FROM romeros'),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                margin: const EdgeInsets.only(top: 30),
                child: const CircularProgressIndicator());
          } else {
            final data = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (context, int index) {
                  return CardsPerfil(
                    id: data[index]['id'],
                    nome: data[index]['nome'],
                    ontap: () => {
                      config_rota().animacao_2(context,
                          novaPagina: PaginaUpdateCadastro(
                            data: data[index],
                          ))
                    },
                  );
                });
          }
        }));
  }
}

// ignore: must_be_immutable
class CardsPerfil extends StatefulWidget {
  int id;
  String nome;
  dynamic ontap = () => {};
  CardsPerfil({super.key, this.ontap, this.nome = '', this.id = 0});

  @override
  // ignore: no_logic_in_create_state
  State<CardsPerfil> createState() =>
      // ignore: no_logic_in_create_state
      _CardsPerfilState(ontap: ontap, nome: nome, id: id);
}

class _CardsPerfilState extends State<CardsPerfil> {
  int id;
  String nome;
  dynamic ontap = () => {};
  _CardsPerfilState({this.ontap, this.nome = '', this.id = 0});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(134, 228, 196, 120)),
              top: BorderSide(color: Color.fromARGB(134, 228, 196, 120)),
              left: BorderSide(color: Color.fromARGB(134, 228, 196, 120)),
              right: BorderSide(color: Color.fromARGB(134, 228, 196, 120))),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25), // Cor da sombra
              offset: Offset(0, 4), // Deslocamento horizontal e vertical
              blurRadius: 4.0, // Raio de desfoque
              spreadRadius: 0.0, // Espalhamento da sombra
            ),
          ],
        ),
        height: 150,
        width: MediaQuery.of(context).size.width * 1,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            // image
            const Expanded(
                flex: 100,
                child: Image(
                  height: 150,
                  image: AssetImage('assets/img_ilustrativa.png'),
                  fit: BoxFit.fitHeight,
                )),
            Expanded(
                flex: 100,
                child: Container(
                  // color: Colors.green,
                  margin: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            'id: $id',
                            style: const TextStyle(
                                fontSize: 17, fontFamily: 'Inter-Medium'),
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'nome: $nome',
                            style: const TextStyle(
                                fontSize: 17, fontFamily: 'Inter-Medium'),
                          )),
                    ],
                  ),
                )),
            Expanded(
                flex: 50,
                child: Container(
                  // color: Colors.green,
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: const Image(
                      image: AssetImage('assets/icons/icon_next.png')),
                )),
          ],
        ),
      ),
    );
  }
}
