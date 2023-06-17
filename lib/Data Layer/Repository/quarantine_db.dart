import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/MOHQuarantineModel.dart';
import '../Model/UserQuarantineModel.dart';

class Quarantine {
  Quarantine._privateContructor();

  static final Quarantine instance = Quarantine._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.quarantine');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database quarantine, int version) async {
    await quarantine.execute(' '
        ' CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER,location TEXT,date TEXT,result TEXT,address TEXT) '
        ' ');

    await quarantine.execute(' '
        ' CREATE TABLE MOH(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,result TEXT, quarantineType TEXT) '
        ' ');
  }

  //add User data
  Future<int> addUser(UserQuarantineModel userModel) async {
    Database quarantine = await instance.database;
    return await quarantine.insert('User', userModel.toJson());
  }

  //add Admin data
  Future<int> addAdmin(MOHQuarantineModel adminModel) async {
    Database quarantine = await instance.database;
    return await quarantine.insert('MOH', adminModel.toJson());
  }

  //get all User data
  Future<List<UserQuarantineModel>> getAllUserData() async {
    Database quarantine = await instance.database;
    final userModel = await quarantine.query('User', orderBy: 'name');
    return userModel.map((json) => UserQuarantineModel.fromJson(json)).toList();
  }

  //get all Admin data
  Future<List<MOHQuarantineModel>> getAllAdminData() async {
    Database quarantine = await instance.database;
    final adminModel = await quarantine.query('MOH', orderBy: 'name');
    return MOHQuarantineModel.map((json) => MOHQuarantineModel.fromJson(json))
        .toList();
  }

  //get specific user data
  Future<UserQuarantineModel> getSpecificUserData(int id) async {
    Database quarantine = await instance.database;
    final userData = await quarantine.query('User',
        columns: [
          'id',
          'name',
          'age',
          'address',
          'location',
          'date',
          'result',
          'address'
        ],
        where: 'id = ?',
        whereArgs: [id]);

    if (userData.isNotEmpty) {
      return UserQuarantineModel.fromJson(userData.first);
    }

    throw Exception('ID not found');
  }

  //get specific admin data
  Future<MOHQuarantineModel> getSpecificAdminData(int id) async {
    Database quarantine = await instance.database;
    final adminData = await quarantine.query('MOH',
        columns: ['id', 'name', 'result', 'quarantineType'],
        where: 'id = ?',
        whereArgs: [id]);

    if (adminData.isNotEmpty) {
      return MOHQuarantineModel.fromJson(adminData.first);
    }

    throw Exception('ID not found');
  }

  //update User Data
  Future<int> updateUser(UserQuarantineModel userModel) async {
    Database quarantine = await instance.database;

    return quarantine.update(
      'User',
      userModel.toJson(),
      where: 'id = ?',
      whereArgs: [userModel.id],
    );
  }

  //update Admin Data
  Future<int> updateAdmin(MOHQuarantineModel adminModel) async {
    Database quarantine = await instance.database;

    return quarantine.update(
      'MOH',
      adminModel.toJson(),
      where: 'id = ?',
      whereArgs: [adminModel.id],
    );
  }

  //delete User Data
  Future<int> deleteUser(int id) async {
    Database quarantine = await instance.database;

    return quarantine.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //delete Admin Data
  Future<int> deleteAdmin(int id) async {
    Database quarantine = await instance.database;

    return quarantine.delete(
      'MOH',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
