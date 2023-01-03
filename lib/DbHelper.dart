import 'dart:async';

import 'package:littlewords/word_dto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static const dbName = 'littlewords.db'; // nom du schema
  static const dbPathName = 'littlewords.path'; // "nom du fichier sur le tel"
  static const dbVersion = 2; // numero de version du scheme (pour upgrade)

  // instance de la connexion a la bdd
  static Database? _database;

  // Construction de DbHelper
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  // Getter de database avec init si necessaire
  Future<Database> get database async => _database ??= await _init();

  // Initialisation de database
  Future<Database> _init() async {
    // On utilise path pour recuperer un emplacement de stockage
    final String dbPath = await getDatabasesPath();

    // On ouvre la connexion
    return await openDatabase(
      join(dbPath, dbPathName),
      onCreate: _onCreate,
      //onUpgrade: _onUpgrade,
      version: dbVersion,
    );
  }

  // Declenche lorsque la base de donnees n'existe pas sur le device
  FutureOr<void> _onCreate(Database db, int version){
    const String createWordsTableQuery =
        'CREATE TABLE words (uid integer PRIMARY KEY AUTOINCREMENT,content VARCHAR(200), author VARCHAR(200), latitude double, longitude double)';
    db.execute(createWordsTableQuery);
  }

  // Declenche lorsque le numero de version est augmente
  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion){
    // Par simplicite, on drop les tables :
    // - NE PAS FAIRE EN PRODUCTION !!!
    const String dropWordsTableQuery = 'DROP TABLE IF EXISTS words';
    db.execute(dropWordsTableQuery);

    // On recree la db
    _onCreate(db, newVersion);
  }

  Future<void> insert(final WordDTO wordDTO) async {
    Database db = await instance.database;

    final String insertWord = "INSERT INTO words (content,author,latitude,longitude) VALUES ('${wordDTO.content}','${wordDTO.author}','${wordDTO.latitude}','${wordDTO.longitude}')";
    return db.execute(insertWord);
  }

  Future<int> countWords() async {
    final Database db = await instance.database;
    var res = await db.rawQuery("SELECT count(*) FROM words");
    var count = Sqflite.firstIntValue(res);
    return Future.value(count);
  }

  // Permet de recuperer la liste complete des mots detenus
  Future<List<WordDTO>> getAllWords() async {
    // Recuperation instance de la db
    final Database db = await instance.database;

    // execution query
    final resultSet = await db.rawQuery("SELECT * FROM words");

    // On initialise une liste de mots vide
    final List<WordDTO> results = <WordDTO>[];

    // On parcours les resultats
    for(var r in resultSet) {
      // On instancie un WordDTO sur la base de r
      var word = WordDTO.fromMap(r);
      // On l'ajoute dans la liste de resultat
      results.add(word);
    }

    // On retourne la liste des resultats
    return Future.value(results);
  }
}