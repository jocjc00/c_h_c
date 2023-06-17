import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/AdminInfoModel.dart';
import '../Model/AdminMsgModel.dart';

class InfoMsg {
  InfoMsg._privateContructor();

  static final InfoMsg instance = InfoMsg._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.infoMsg');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database infoMsg, int version) async {
    await infoMsg.execute(' '
        ' CREATE TABLE AdminMsg(id INTEGER PRIMARY KEY AUTOINCREMENT,msg TEXT,zone TEXT,cluster INTEGER) '
        ' ');

    await infoMsg.execute(' '
        ' CREATE TABLE AdminInfo(id INTEGER PRIMARY KEY AUTOINCREMENT,info TEXT,desc TEXT,cases INTEGER,ttlCases INTEGER,rec INTEGER,fVac INTEGER,doseAdm INTEGER) '
        ' ');
  }

  //add Admin Msg data
  Future<int> addMsg(AdminMsgModel adminMsgModel) async {
    Database infoMsg = await instance.database;
    return await infoMsg.insert('AdminMsg', adminMsgModel.toJson());
  }

  //add Admin Info data
  Future<int> addAdmin(AdminInfoModel adminInfoModel) async {
    Database infoMsg = await instance.database;
    return await infoMsg.insert('AdminInfo', adminInfoModel.toJson());
  }

  //get all Admin Msg data
  Future<List<AdminMsgModel>> getAllMsgData() async {
    Database infoMsg = await instance.database;
    final adminMsgModel = await infoMsg.query('AdminMsg', orderBy: 'id');
    return adminMsgModel.map((json) => AdminMsgModel.fromJson(json)).toList();
  }

  //get all Admin Info data
  Future<List<AdminInfoModel>> getAllAdminData() async {
    Database infoMsg = await instance.database;
    final adminInfoModel = await infoMsg.query('AdminInfo', orderBy: 'id');
    return adminInfoModel.map((json) => AdminInfoModel.fromJson(json)).toList();
  }

  //get specific admin msg data
  Future<AdminMsgModel> getSpecificMsgData(int id) async {
    Database infoMsg = await instance.database;
    final msgData = await infoMsg.query('AdminMsg',
        columns: ['id', 'msg', 'zone', 'cluster'], where: 'id = ?', whereArgs: [id]);

    if (msgData.isNotEmpty) {
      return AdminMsgModel.fromJson(msgData.first);
    }

    throw Exception('ID not found');
  }

  //get specific admin info data
  Future<AdminInfoModel> getSpecificAdminData(int id) async {
    Database infoMsg = await instance.database;
    final adminData = await infoMsg.query('AdminInfo',
        columns: [
          'id',
          'info',
          'desc',
          'cases',
          'ttlCases',
          'rec',
          'fVac',
          'doseAdm'
        ],
        where: 'id = ?',
        whereArgs: [id]);

    if (adminData.isNotEmpty) {
      return AdminInfoModel.fromJson(adminData.first);
    }

    throw Exception('ID not found');
  }

  //update Admin Msg Data
  Future<int> updateMsg(AdminMsgModel adminMsgModel) async {
    Database infoMsg = await instance.database;

    return infoMsg.update(
      'AdminMsg',
      adminMsgModel.toJson(),
      where: 'id = ?',
      whereArgs: [adminMsgModel.id],
    );
  }

  //update Admin Info Data
  Future<int> updateAdmin(AdminInfoModel adminInfoModel) async {
    Database infoMsg = await instance.database;

    return infoMsg.update(
      'AdminInfo',
      adminInfoModel.toJson(),
      where: 'id = ?',
      whereArgs: [adminInfoModel.id],
    );
  }

  //delete Admin Msg Data
  Future<int> deleteMsg(int id) async {
    Database infoMsg = await instance.database;

    return infoMsg.delete(
      'AdminMsg',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //delete Admin Info Data
  Future<int> deleteAdmin(int id) async {
    Database infoMsg = await instance.database;

    return infoMsg.delete(
      'AdminInfo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
