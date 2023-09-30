//=====================================================
//"import 'package:flutter/services.dart'" aparentemente é reduntante, se possível, deixar apenas "import 'package:flutter/material.dart'";
//=====================================================
import 'package:rota_religiosa/model/stream.dart';
import 'package:flutter/material.dart';

//====================================
//Local de seleção de cidades
//====================================

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
      // ignore: no_logic_in_create_state
      _WidgetDropComponentState(campo: campo, valuex: value);
}

class _WidgetDropComponentState extends State<WidgetDropComponent> {
  TextEditingController campo;
  List cidades = [
    "Belem",
    "Ananindeua",
    "Abaetetuba",
    "Barcarena",
    "Castanhal",
    "maranhao",
    "Abel Figueiredo",
    "Acará",
    "Afuá",
    "Água Azul do Norte",
    "Alenquer",
    "Almeirim",
    "Altamira",
    "Anajás",
    "Anapu",
    "Augusto Corrêa",
    "Aurora do Pará",
    "Aveiro",
    "Bagre",
    "Baião",
    "Bannach",
    "Belterra",
    "Benevides",
    "Bom Jesus do Tocantins",
    "Bonito",
    "Bragança",
    "Brasil Novo",
    "Brejo Grande do Araguaia",
    "Breu Branco",
    "Breves",
    "Bujaru",
    "Cachoeira do Arari",
    "Cachoeira do Piriá",
    "Cametá",
    "Canaã dos Carajás",
    "Capanema",
    "Capitão Poço",
    "Chaves",
    "Colares",
    "Conceição do Araguaia",
    "Concórdia do Pará",
    "Cumaru do Norte",
    "Curionópolis",
    "Curralinho",
    "Curuá",
    "Curuçá",
    "Dom Eliseu",
    "Eldorado dos Carajás",
    "Faro",
    "Floresta do Araguaia",
    "Garrafão do Norte",
    "Goianésia do Pará",
    "Gurupá",
    "Igarapé-Açu",
    "Igarapé-Miri",
    "Inhangapi",
    "Ipixuna do Pará",
    "Irituia",
    "Itaituba",
    "Itupiranga",
    "Jacareacanga",
    "Jacundá",
    "Juruti",
    "Limoeiro do Ajuru",
    "Mãe do Rio",
    "Magalhães Barata",
    "Marabá",
    "Maracanã",
    "Marapanim",
    "Marituba",
    "Medicilândia",
    "Melgaço",
    "Mocajuba",
    "Moju",
    "Monte Alegre",
    "Muaná",
    "Nova Esperança do Piriá",
    "Nova Ipixuna",
    "Nova Timboteua",
    "Novo Progresso",
    "Novo Repartimento",
    "Óbidos",
    "Oeiras do Pará",
    "Oriximiná",
    "Ourém",
    "Ourilândia do Norte",
    "Pacajá",
    "Palestina do Pará",
    "Paragominas",
    "Parauapebas",
    "Pau D'Arco",
    "Peixe-Boi",
    "Piçarra",
    "Placas",
    "Ponta de Pedras",
    "Portel",
    "Porto de Moz",
    "Prainha",
    "Primavera",
    "Quatipuru",
    "Redenção",
    "Rio Maria",
    "Rondon do Pará",
    "Rurópolis",
    "Salinópolis",
    "Salvaterra",
    "Santa Bárbara do Pará",
    "Santa Cruz do Arari",
    "Santa Isabel do Pará",
    "Santa Luzia do Pará",
    "Santa Maria das Barreiras",
    "Santa Maria do Pará",
    "Santana do Araguaia",
    "Santarém",
    "Santarém Novo",
    "Santo Antônio do Tauá",
    "São Caetano de Odivelas",
    "São Domingos do Araguaia",
    "São Domingos do Capim",
    "São Félix do Xingu",
    "São Francisco do Pará",
    "São Geraldo do Araguaia",
    "São João da Ponta",
    "São João de Pirabas",
    "São João do Araguaia",
    "São Miguel do Guamá",
    "São Sebastião da Boa Vista",
    "Sapucaia",
    "Senador José Porfírio",
    "Soure",
    "Tailândia",
    "Terra Alta",
    "Terra Santa",
    "Tomé-Açu",
    "Tracuateua",
    "Trairão",
    "Tucumã",
    "Tucuruí",
    "Ulianópolis",
    "Uruará",
    "Vigia",
    "Viseu",
    "Vitória do Xingu",
    "Xinguara"
  ];
  String valuex;
  _WidgetDropComponentState({required this.campo, this.valuex = ''});

  List<DropdownMenuEntry<String>> dropdownMenuEntries = [];
  @override
  void initState() {
    super.initState();
    for (String cidade in cidades) {
      dropdownMenuEntries.add(DropdownMenuEntry(value: cidade, label: cidade));
    }
  }

  StreamDados streamDados = StreamDados();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const Spacer(flex: 15),
          Expanded(
              flex: 20,
              child: Column(
                children: [
                  // margem
                  Container(margin: const EdgeInsets.only(bottom: 27)),
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
                          margin: const EdgeInsets.only(left: 10),
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
