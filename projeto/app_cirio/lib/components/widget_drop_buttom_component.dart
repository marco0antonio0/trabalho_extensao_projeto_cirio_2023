import 'package:app_cirio/model/stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const cidades = [
  "Abaetetuba",
  "Abel_Figueiredo",
  "Acará",
  "Afuá",
  "Água_Azul_do_Norte",
  "Alenquer",
  "Almeirim",
  "Altamira",
  "Anajás",
  "Ananindeua",
  "Anapu",
  "Augusto_Corrêa",
  "Aurora_do_Pará",
  "Aveiro",
  "Bagre",
  "Baião",
  "Bannach",
  "Barcarena",
  "Belém",
  "Belterra",
  "Benevides",
  "Bom_Jesus_do_Tocantins",
  "Bonito",
  "Bragança",
  "Brasil_Novo",
  "Brejo_Grande_do_Araguaia",
  "Breu_Branco",
  "Breves",
  "Bujaru",
  "Cachoeira_do_Arari",
  "Cachoeira_do_Piriá",
  "Cametá",
  "Canaã_dos_Carajás",
  "Capanema",
  "Capitão_Poço",
  "Castanhal",
  "Chaves",
  "Colares",
  "Conceição_do_Araguaia",
  "Concórdia_do_Pará",
  "Cumaru_do_Norte",
  "Curionópolis",
  "Curralinho",
  "Curuá",
  "Curuçá",
  "Dom_Eliseu",
  "Eldorado_dos_Carajás",
  "Faro",
  "Floresta_do_Araguaia",
  "Garrafão_do_Norte",
  "Goianésia_do_Pará",
  "Gurupá",
  "Igarapé-Açu",
  "Igarapé-Miri",
  "Inhangapi",
  "Ipixuna_do_Pará",
  "Irituia",
  "Itaituba",
  "Itupiranga",
  "Jacareacanga",
  "Jacundá",
  "Juruti",
  "Limoeiro_do_Ajuru",
  "Mãe_do_Rio",
  "Magalhães_Barata",
  "Marabá",
  "Maracanã",
  "Marapanim",
  "Marituba",
  "Medicilândia",
  "Melgaço",
  "Mocajuba",
  "Moju",
  "Monte_Alegre",
  "Muaná",
  "Nova_Esperança_do_Piriá",
  "Nova_Ipixuna",
  "Nova_Timboteua",
  "Novo_Progresso",
  "Novo_Repartimento",
  "Óbidos",
  "Oeiras_do_Pará",
  "Oriximiná",
  "Ourém",
  "Ourilândia_do_Norte",
  "Pacajá",
  "Palestina_do_Pará",
  "Paragominas",
  "Parauapebas",
  "Pau_D'Arco",
  "Peixe-Boi",
  "Piçarra",
  "Placas",
  "Ponta_de_Pedras",
  "Portel",
  "Porto_de_Moz",
  "Prainha",
  "Primavera",
  "Quatipuru",
  "Redenção",
  "Rio_Maria",
  "Rondon_do_Pará",
  "Rurópolis",
  "Salinópolis",
  "Salvaterra",
  "Santa_Bárbara_do_Pará",
  "Santa_Cruz_do_Arari",
  "Santa_Isabel_do_Pará",
  "Santa_Luzia_do_Pará",
  "Santa_Maria_das_Barreiras",
  "Santa_Maria_do_Pará",
  "Santana_do_Araguaia",
  "Santarém",
  "Santarém_Novo",
  "Santo_Antônio_do_Tauá",
  "São_Caetano_de_Odivelas",
  "São_Domingos_do_Araguaia",
  "São_Domingos_do_Capim",
  "São_Félix_do_Xingu",
  "São_Francisco_do_Pará",
  "São_Geraldo_do_Araguaia",
  "São_João_da_Ponta",
  "São_João_de_Pirabas",
  "São_João_do_Araguaia",
  "São_Miguel_do_Guamá",
  "São_Sebastião_da_Boa_Vista",
  "Sapucaia",
  "Senador_José_Porfírio",
  "Soure",
  "Tailândia",
  "Terra_Alta",
  "Terra_Santa",
  "Tomé-Açu",
  "Tracuateua",
  "Trairão",
  "Tucumã",
  "Tucuruí",
  "Ulianópolis",
  "Uruará",
  "Vigia",
  "Viseu",
  "Vitória_do_Xingu",
  "Xinguara"
];

// ignore: must_be_immutable
class WidgetDropComponent extends StatefulWidget {
  TextEditingController campo = TextEditingController();
  TextInputType? mode;
  String titulo;
  String value;
  WidgetDropComponent(
      {super.key,
      this.titulo = '',
      this.value = '',
      this.mode = TextInputType.text,
      required this.campo});

  @override
  State<WidgetDropComponent> createState() =>
      _WidgetDropComponentState(campo: campo, valuex: value);
}

class _WidgetDropComponentState extends State<WidgetDropComponent> {
  TextEditingController campo;
  String valuex;
  _WidgetDropComponentState({required this.campo, this.valuex = ''});

  List<DropdownMenuEntry<String>> dropdownMenuEntries = [];
  void initState() {
    super.initState();
    for (String cidade in cidades) {
      dropdownMenuEntries.add(DropdownMenuEntry(value: cidade, label: cidade));
    }
  }

  StreamDados streamDados = StreamDados();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Spacer(flex: 15),
          Expanded(
              flex: 20,
              child: Column(
                children: [
                  // margem
                  Container(margin: EdgeInsets.only(bottom: 27)),
                  // icone santinha
                  Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: const Image(
                          filterQuality: FilterQuality.high,
                          height: 40,
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/icons/icon_santinha.png'))),
                ],
              )),
          Expanded(
              flex: 100,
              child: Column(
                children: [
                  // text titulo
                  Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        widget.titulo,
                        style: const TextStyle(fontFamily: 'Kanit'),
                      )),
                  // component TextFiedld
                  DropdownMenu(
                      controller: campo,
                      menuHeight: 200,
                      onSelected: (value) {
                        streamDados.atualizarcidade(value!);
                      },
                      label: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(valuex.isEmpty ? 'Selecione' : valuex)),
                      initialSelection: streamDados.cidadex,
                      enableFilter: true,
                      enabled: true,
                      enableSearch: true,
                      width: MediaQuery.of(context).size.width * 0.6,
                      menuStyle: const MenuStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(255, 255, 255, 0.985))),
                      dropdownMenuEntries: dropdownMenuEntries)
                ],
              )),
          const Spacer(flex: 25)
        ],
      ),
    );
  }
}
