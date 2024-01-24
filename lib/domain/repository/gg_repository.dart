import 'package:getgoing_flutter/domain/models/db_node.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../utils/app_constants.dart';
import '../models/db_route.dart';

class GGRepository {
  Database? _database;

  static final GGRepository instance = GGRepository._init();

  GGRepository._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('get_going.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
create table ${'DbRoute'} ( 
    ${AppConst.id} integer primary key autoincrement, 
    ${AppConst.latitude} REAL not null,
    ${AppConst.longitude} REAL not null,
    ${AppConst.velocity} REAL not null,
    ${AppConst.number} integer not null,
    ${AppConst.last} integer not null,
    ${AppConst.routeId} integer not null)
''');

    await db.execute('''
create table ${'DbNode'} ( 
    ${AppConst.id} integer primary key autoincrement, 
    ${AppConst.duration} integer not null,
    ${AppConst.energy} REAL not null,
    ${AppConst.length} REAL not null,
    ${AppConst.date} TEXT,
    ${AppConst.avgSpeed} REAL not null,
    ${AppConst.currentSpeed} REAL not null,
    ${AppConst.activityId} integer not null,
    ${AppConst.goal} integer not null)
''');
  }

  Future<void> insertDbRoute({required DbRoute dbRoute}) async {
    try {
      final db = await database;
      db.insert('DbRoute', dbRoute.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> insertDbNode({required DbNode dbNode}) async {
    try {
      final db = await database;
      db.insert('DbNode', dbNode.toMap());
    } catch (e) {
      print(e.toString());
    }
  }
}
