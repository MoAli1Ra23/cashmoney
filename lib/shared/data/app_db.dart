import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
@LazySingleton(env:['debug', 'prod'])
class AppDb{
  static Database? _db;
  @preResolve
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db!;
    } else {
      return _db!;
    }
  }

  initDb() async {
    String p = await getDatabasesPath();
    String fullDbPath = join(p, "cashMony.db");
    Database db = await openDatabase(fullDbPath,
        onCreate: onCreate, version: 7, onUpgrade: onUpgrade);
    return db;
  }

  FutureOr<void> onUpgrade(Database db, int oldVersion, int newVersion) {
//     var x = db.execute('''INSERT INTO Walates(mony)
//     VALUES(0)
// ''');
//     print("onupjrade_   _______========&&&&&&$x");
  }

  onCreate(Database db, int varsion) {
    
    db.execute('''
CREATE TABLE  "expense" (
id INTEGER  PRIMARY KEY  AUTOINCREMENT,
title Text   Not Null,
details Text   Not Null,
note Text   Not Null,
value REAL Not Null,
date  INTEGER  Not Null

)
''');
 /**  final int id;
  final double value;
  final String source;
  final DateTime date;
 */
db.execute('''
CREATE TABLE  "incomes"(
 id INTEGER   PRIMARY KEY  AUTOINCREMENT,
  value REAL  Not Null,
  source Text  Not Null,
  date INTEGER  Not Null 
)
''');
db.execute('''
CREATE TABLE  "sources"(
 id INTEGER   PRIMARY KEY  AUTOINCREMENT,
 text Text  Not Null
   )
''');
db.execute('''
CREATE TABLE  "expensesTitle"(
 id INTEGER   PRIMARY KEY  AUTOINCREMENT,
 text Text  Not Null
   )
''');
db.execute('''
CREATE TABLE  "wallate"(
 id INTEGER   PRIMARY KEY  AUTOINCREMENT,
 balance REAL  Not Null
   )
''');
}

  @preResolve
  Future<List<Map<String,dynamic>>> readdate(String s) async {
    Database? md = await db;
    List<Map<String,dynamic>> r = await md!.rawQuery(s);
    return r;
  }

  @preResolve

  // 01064540324
  Future<List<Map>> querydate(String s) async {
    Database? md = await db;
    List<Map> r = await md!.rawQuery(s);
    return r;
  }

  // 01064540324
  @preResolve
  Future<int> insert(String s) async {
    Database? md = await db;
    var r = await md!.rawInsert(s);
    return r;
  }

  @preResolve
  Future<int> detletitem(String s,[List<Object?>? arguments]) async {
    Database? md = await db;
    if( arguments!=null){
         await md!.execute(s);

    // var r = await md!.rawDelete(s,arguments);
        return 1;

    }
    else
    {
       var r = await md!.rawDelete(s);
        return r;

    }
    
  }

  @preResolve
  Future<int> updateitem(String s) async {
    Database? md = await db;
    var r = await md!.rawUpdate(s);
    return r;
  }

}