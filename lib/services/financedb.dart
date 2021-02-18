import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Financedatabase {
  static final table = 'my_table_finance_re';
  static final columnID = 'id';
  static final columnData = 'data';
  static final columnFood = 'food';
  static final columnTransport = 'transport';
  static final columnClothes = 'clothes';
  static final columnOther = 'other';
  static final columnSum = 'summ';
  static final _databasename = 'financere.db';
  static final _databaseversion = 1;
  static Database _financedatabase;
  Financedatabase._privateConstructor();
  static final Financedatabase instance = Financedatabase._privateConstructor();

  Future<Database> get database async {
    if (_financedatabase != null) return _financedatabase;

    _financedatabase = await _initDatabase();
    return _financedatabase;
  }

  _initDatabase() async {
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentdirectory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    // sql code
    await db.execute('''
      CREATE TABLE $table (
        $columnID INTEGER PRIMARY KEY,
        $columnData TEXT NOT NULL,
        $columnFood INTEGER NOT NULL,
        $columnClothes INTEGER NOT NULL,
        $columnTransport INTEGER NOT NULL,
        $columnOther INTEGER NOT NULL,
        $columnSum INTEGER NOT NULL
      );
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // function to query all the rows
  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // function to delete some data
  Future<int> deletedata(int id) async {
    Database db = await instance.database;
    var res = await db.delete(table, where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> update(int id) async {
    Database db = await instance.database;
    var res = await db.update(table, {"name": "Desi Programmer", "age": 2},
        where: "id = ?", whereArgs: [id]);
    return res;
  }
}
