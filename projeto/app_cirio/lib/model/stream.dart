class StreamDados {
  // cria uma unica instancia do objeto StreamDados e atribui a >>>>> _instancia
  static final StreamDados _instancia = StreamDados._privado();
  //=============================================================
  // variavel da instancia
  String _medicamento = '';
  String _opSexo = '';
  String _cidadex = '';
  //=============================================================

  // força a retorna uma unica instancia
  factory StreamDados() {
    return _instancia;
  }
  // proteção da classe de chamadas adms
  StreamDados._privado();
  //=============================================================
  // metodos getters
  String get medicamento => _medicamento;
  String get opSexo => _opSexo;
  String get cidadex => _cidadex;
  //=============================================================
  // metodos settes
  void atualizarListaMedicamento(String data) {
    _medicamento = data;
  }

  void atualizarOpSexo(String data) {
    _opSexo = data;
  }

  void atualizarcidade(String data) {
    _cidadex = data;
  }
  //=============================================================
}
