import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Cria uma instância única da classe DatabaseHelper.
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();

  // Fábrica para retornar a instância única.
  factory DatabaseHelper() {
    return _instance;
  }

  // Construtor privado para evitar a criação de instâncias adicionais.
  DatabaseHelper._privateConstructor();

  // Armazena a instância do banco de dados.
  static Database? _database;

  // Getter para obter a instância do banco de dados.
  Future<Database> get database async {
    // Se já tivermos uma instância, retornamos essa instância.
    if (_database != null) return _database!;

    // Caso contrário, inicializamos o banco de dados e o retornamos.
    _database = await _initDatabase();
    return _database!;
  }

  // Método privado para inicializar o banco de dados.
  Future<Database> _initDatabase() async {
    // Define o caminho do banco de dados usando o pacote path.
    final path = join(await getDatabasesPath(), 'data129.db');

    // Abre o banco de dados SQLite e cria-o se não existir.
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Método chamado durante a criação do banco de dados para criar tabelas.
  Future<void> _onCreate(Database db, int version) async {
    // Crie as tabelas do banco de dados aqui, substitua 'your_table' por seus próprios nomes de tabela e definições de esquema.
    await db.execute('''
      CREATE TABLE romeros (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          idade INTEGER,
          atendimento TEXT,
          sexo TEXT,
          distancia INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE usuario (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          idUsuario TEXT,
          nome TEXT,
          telefone INTEGER,
          bloco TEXT,
          pass TEXT
      )
    ''');
  }

  //=========================================================================
  //            table functions participante
  //=========================================================================
  // Método para executar consultas SQL e retornar os resultados como uma lista de mapas.
  Future<List<Map<String, dynamic>>> query(String query,
      [List<dynamic>? arguments]) async {
    final db = await database;
    return db.rawQuery(query, arguments);
  }

  Future<int> insertCad({data}) async {
    final db = await database;
    final id = await db.rawInsert('''
    INSERT INTO romeros (nome, idade, atendimento, sexo, distancia)
    VALUES (?, ?, ?, ?, ?)
  ''', [
      data['nome'],
      data['idade'],
      data['atendimento'],
      data['sexo'],
      data['distancia']
    ]);

    return id;
  }

  Future<int> updateCad({data}) async {
    final db = await database;
    final id = await db.rawInsert('''
    UPDATE romeros
    SET nome = ?, idade = ?, atendimento = ?, sexo = ?, distancia = ?
    WHERE id = ?
  ''', [
      data['nome'],
      data['idade'],
      data['atendimento'],
      data['sexo'],
      data['distancia'],
      data['id']
    ]);

    return id;
  }

  Future<int> deleteCad({int? id}) async {
    final db = await database;
    final rowsDeleted = await db.delete(
      'romeros',
      where: 'id = ?',
      whereArgs: [id],
    );
    return rowsDeleted;
  }
  //=========================================================================
  //            table functions usuario
  //=========================================================================

  Future<int> insertUser({data}) async {
    final db = await database;
    final id = await db.rawInsert('''
    INSERT INTO usuario (idUsuario,nome, telefone, bloco,pass)
    VALUES (?,?,?,?,?)
  ''', [
      data['idUsuario'],
      data['nome'],
      data['telefone'],
      data['bloco'],
      data['pass'],
    ]);

    return id;
  }

  // Método para executar consultas SQL e retornar os resultados como uma lista de mapas.
  Future<List<Map<String, dynamic>>> selectUser() async {
    try {
      final db = await database;
      return db.rawQuery('SELECT * FROM usuario');
    } catch (e) {
      return [];
    }
  }

  Future updateUser({data}) async {
    try {
      final db = await database;
      final id = await db.rawUpdate('''
    UPDATE usuario
    SET nome = ?, telefone = ?, bloco = ?, idUsuario = ? ,pass = ?
    WHERE id = ?
  ''', [
        data['nome'],
        data['telefone'],
        data['bloco'],
        data['idUsuario'],
        data['pass'],
        data['id']
      ]);

      return id;
    } catch (e) {
      return 0;
    }
  }

  // Função para obter o caminho atual do banco de dados.
  Future<String?> getDatabasePath() async {
    try {
      // Obtenha o caminho do diretório de documentos do aplicativo.
      final documentsDirectory = await getApplicationDocumentsDirectory();

      // Defina o nome do arquivo de banco de dados.
      final databasePath = join(documentsDirectory.path, 'data4.db');

      return databasePath;
    } catch (e) {
      return null;
    }
  }
}
