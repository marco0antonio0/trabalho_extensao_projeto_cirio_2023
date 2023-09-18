import 'package:app_cirio/paginas/pagina_updateCad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ColunaDeCadastrados extends StatefulWidget {
  const ColunaDeCadastrados({super.key});

  @override
  State<ColunaDeCadastrados> createState() => _ColunaDeCadastradosState();
}

class _ColunaDeCadastradosState extends State<ColunaDeCadastrados> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CardsPerfil(
            ontap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaginaUpdateCadastro()))
            },
          ),
          CardsPerfil(
            ontap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaginaUpdateCadastro()))
            },
          ),
          CardsPerfil(
            ontap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaginaUpdateCadastro()))
            },
          ),
          CardsPerfil(
            ontap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaginaUpdateCadastro()))
            },
          ),
          CardsPerfil(
            ontap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaginaUpdateCadastro()))
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CardsPerfil extends StatefulWidget {
  dynamic ontap = () => {};
  CardsPerfil({super.key, this.ontap});

  @override
  // ignore: no_logic_in_create_state
  State<CardsPerfil> createState() => _CardsPerfilState(ontap: ontap);
}

class _CardsPerfilState extends State<CardsPerfil> {
  dynamic ontap = () => {};
  _CardsPerfilState({this.ontap});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        child: const Text(
                          'id: Lorem',
                          style: TextStyle(
                              fontSize: 17, fontFamily: 'Inter-Medium'),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Lorem ipsum dolor',
                          style: TextStyle(
                              fontSize: 17, fontFamily: 'Inter-Medium'),
                        )),
                  ],
                ),
              )),
          Expanded(
              flex: 50,
              child: InkWell(
                onTap: ontap,
                child: Container(
                  // color: Colors.green,
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: const Image(
                      image: AssetImage('assets/icons/icon_next.png')),
                ),
              )),
        ],
      ),
    );
  }
}
