import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wanandroid_flutter/global/constant_sql.dart';

class SqlManager {
  static const _VERSION = 1;

  static const _NAME = "my_test_wan_android_flutter.db";

  static Database _database;

  ///初始化
  static _init() async {
    // open the database
    var databasesPath = await getDatabasesPath();
    String dbName = _NAME;

    String path = databasesPath + "/" + dbName;

    _database = await openDatabase(path, version: _VERSION);
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await _init();
    }
    return _database;
  }

  ///判断表是否存在
  static Future<bool> isTableExist(String tableName) async {
    await getCurrentDatabase();
    var queryTable = await _database.rawQuery(ConstantSql.queryTab(tableName));
    return queryTable != null && queryTable.length > 0;
  }

  ///获取所有表
  static Future<List<Map<String, dynamic>>> getAllTab() async {
    await getCurrentDatabase();
    return  _database.rawQuery(ConstantSql.queryAllTab());
  }

  ///创建表
  static Future createTab(String tabName, String column) async {
    await getCurrentDatabase();
    return await _database.execute(ConstantSql.createTab(tabName, column));
  }

  ///删除表
  static Future deleteTab(String tabName) async {
   return await _database.rawDelete(ConstantSql.deleteTab(tabName));
  }

  ///关闭
  static close() {
    _database?.close();
    _database = null;
  }



}
