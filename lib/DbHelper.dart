import 'dart:async';

//import 'package:littlewords/dto/word_dto.dart';
import 'package:flutter/material.dart';
import 'package:littlewords/WordDTO.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DbHelper {
  static const dbName = 'littlewords.db';
  static const dbPathName = "littlewords.path";
  static const dbVersion = 1;

  static Database? _database;

  DbHelper._privateConstructor();

  static final DbHelper instance = DbHelper._privateConstructor();

  Future <Database> get database async => _database ??= await _init();

  Future <Database> _init() async {
    final String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, dbPathName),
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      version : dbVersion,
    );
  }

  FutureOr<void> _onCreate(Database db, int version){
    const String createWordsTableQuery =
        'Create TABLE words(uid integer PRIMARY KEY AUTOINCREMENT,content VARCHAR(200) NOT NULL';
    db.execute(createWordsTableQuery);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion){
    const String dropWordsTableQuery = "DROP TABLE IF EXISTS words";
    db.execute(dropWordsTableQuery);

    _onCreate(db, newVersion);
  }

  Future<void> insert(final WordDTO wordDTO) async {
    Database db = await instance.database;
    final String insertWord =
        "Insert Into words (content) values (' ${wordDTO.content}')";
    return db.execute(insertWord);
  }

}