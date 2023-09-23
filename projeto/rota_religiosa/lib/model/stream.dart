class StreamDados {
  // cria uma unica instancia do objeto StreamDados e atribui a >>>>> _instancia
  static final StreamDados _instancia = StreamDados._privado();
  //=============================================================
  // variavel da instancia
  String _atendimento = '';
  String _opSexo = '';
  String _cidadex = '';
  dynamic _data;
  //=============================================================

  // força a retorna uma unica instancia
  factory StreamDados() {
    return _instancia;
  }
  // proteção da classe de chamadas adms
  StreamDados._privado();
  //=============================================================
  // metodos getters
  String get atendimento => _atendimento;
  String get opSexo => _opSexo;
  String get cidadex => _cidadex;
  dynamic get data => _data;
  //=============================================================
  // metodos settes
  void atualizarListaAtendimento(String data) {
    _atendimento = data;
  }

  void atualizarOpSexo(String data) {
    _opSexo = data;
  }

  void atualizarcidade(data) {
    _cidadex = data;
  }

  void atualizardata(dynamic data) {
    _data = data;
  }
  //=============================================================
}
