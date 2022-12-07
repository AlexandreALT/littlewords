import 'dart:async';

import 'package:littlewords/word_dto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static const dbName = 'littlewords.db'; // nom du schema
  static const dbPathName = 'littlewords.path'; // "nom du fichier sur le tel"
  static const dbVersion = 1; // numero de version du scheme (pour upgrade)

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
        'CREATE TABLE words (uid integer PRIMARY KEY AUTOINCREMENT,content VARCHAR(200) NOT NULL)';
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
    final String insertWord = "INSERT INTO words (content) VALUES ('${wordDTO.content}')";
    return db.execute(insertWord);
  }
}