import 'dart:io';
import 'package:getgoing_flutter/models/db_node.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/db_route.dart';
import '../../utils/app_constants.dart';
import 'package:path_provider/path_provider.dart';

class GGRepository {
  Database? _database;

  static final GGRepository instance = GGRepository._init();

  GGRepository._init();

  Future<String> getDatabasePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "get_going.db");
    return path;
  }

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
create table ${AppConst.dbNodeTable} ( 
    ${AppConst.id} integer primary key autoincrement, 
    ${AppConst.latitude} REAL not null,
    ${AppConst.longitude} REAL not null,
    ${AppConst.velocity} REAL not null,
    ${AppConst.number} REAL not null,
    ${AppConst.last} integer not null,
    ${AppConst.routeId} integer not null)
''');

    await db.execute('''
create table ${AppConst.dbRouteTable} ( 
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

  Future<int> insertDbNode({required DbNode dbNode}) async {
    try {
      final db = await instance.database;
      return await db.insert(AppConst.dbNodeTable, dbNode.toMap());
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }

  Future<int> insertDbRoute({required DbRoute dbRoute}) async {
    try {
      final db = await instance.database;
      return await db.insert(AppConst.dbRouteTable, dbRoute.toMap());
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }

  Future<List<DbNode>> getAllDbNodes() async {
    final db = await instance.database;

    final result = await db.query(AppConst.dbNodeTable);
    return result.map((json) => DbNode.fromJson(json)).toList();
  }

  Future<List<DbRoute>> getAllDBRoutes() async {
    final db = await database;

    final result = await db.query(AppConst.dbRouteTable);
    return result.map((json) => DbRoute.fromJson(json)).toList();
  }

  Future<void> deleteAllByRouteId(int id) async {
    try {
      final db = await instance.database;
      await db.delete(
        AppConst.dbNodeTable,
        where: '${AppConst.routeId} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteRouteById(int id) async {
    try {
      final db = await instance.database;
      await db.delete(
        AppConst.dbRouteTable,
        where: '${AppConst.id} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateNode(DbNode dbNode) async {
    try {
      final db = await instance.database;
      db.update(
        AppConst.dbNodeTable,
        dbNode.toMap(),
        where: '${AppConst.id} = ?',
        whereArgs: [dbNode.id],
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int> updateRoute(DbRoute dbRoute) async {
    try {
      final db = await instance.database;
      return await db.update(
        AppConst.dbRouteTable,
        dbRoute.toMap(),
        where: '${AppConst.id} = ?',
        whereArgs: [dbRoute.id],
      );
    } catch (e) {
      return 0;
    }
  }

  Future<DbNode?> getLastNode() async {
    try {
      final db = await instance.database;
      final result = await db.query(
        AppConst.dbNodeTable,
        orderBy: '${AppConst.id} desc',
        limit: 1,
      );
      return result.map((json) => DbNode.fromJson(json)).single;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<DbRoute?> getLatestRoute() async {
    try {
      final db = await instance.database;
      final result = await db.query(
        AppConst.dbRouteTable,
        where: '${AppConst.goal} > 0',
        orderBy: '${AppConst.id} desc',
        limit: 1,
      );
      return result.map((json) => DbRoute.fromJson(json)).single;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<DbRoute?> getRouteById(int id) async {
    try {
      final db = await instance.database;
      final result = await db.query(
        AppConst.dbRouteTable,
        where: '${AppConst.id} = $id',
      );
      return result.map((json) => DbRoute.fromJson(json)).single;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
