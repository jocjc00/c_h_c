import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/UserMovementModel.dart';




class Movement {
  Movement._privateContructor();

  static final Movement instance = Movement._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.movement');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database movement, int version) async {
    await movement.execute(' '
        ' CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, dependent TEXT, phoneNumber TEXT, emailAddress TEXT, location TEXT, date TEXT, time TEXT, vaccStatus TEXT, riskStatus TEXT) '
        ' ');

    await movement.execute(' '
        ' CREATE TABLE Admin(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER) '
        ' ');
  }

  //add User data
  Future<int> addUser(UserMovementModel userMovementModel) async
  {
    Database movement = await instance.database;
    return await movement.insert('User',userMovementModel.toJson());
  }

  // //add Admin data
  // Future<int> addAdmin(AdminModel adminModel) async
  // {
  //   Database db = await instance.database;
  //   return await db.insert('Admin',adminModel.toJson());
  // }


  //get all User data
  Future<List<UserMovementModel>> getAllUserData() async {
    Database movement = await instance.database;
    final userMovementModel = await movement.query('User', orderBy: 'name');
    return userMovementModel.map((json) => UserMovementModel.fromJson(json)).toList();
  }

  // //get all Admin data
  // Future<List<AdminModel>> getAllAdminData() async {
  //   Database db = await instance.database;
  //   final adminModel = await db.query('Admin', orderBy: 'name');
  //   return adminModel.map((json) => AdminModel.fromJson(json)).toList();
  // }

  //get specific user data
  Future<UserMovementModel> getSpecificUserData(int id) async {
    Database movement = await instance.database;
    final userData = await movement.query('User',
        columns: ['id', 'name', 'dependent', 'phoneNumber', 'emailAddress', 'location'], where: 'id = ?', whereArgs: [id]);

    if (userData.isNotEmpty) {
      return UserMovementModel.fromJson(userData.first);
    }

    throw Exception('ID not found');
  }

  // //get specific admin data
  // Future<AdminModel> getSpecificAdminData(int id) async {
  //   Database db = await instance.database;
  //   final adminData = await db.query('Admin',
  //       columns: ['id', 'name', 'age'], where: 'id = ?', whereArgs: [id]);

  //   if (adminData.isNotEmpty) {
  //     return AdminModel.fromJson(adminData.first);
  //   }

  //   throw Exception('ID not found');
  // }

  //update User Data
  Future<int> updateUser(UserMovementModel userMovementModel) async {
    Database movement = await instance.database;

    return movement.update(
      'User',
      userMovementModel.toJson(),
      where: 'id = ?',
      whereArgs: [userMovementModel.id],
    );
  }

  // //update Admin Data
  // Future<int> updateAdmin(AdminModel adminModel) async {
  //   Database db = await instance.database;

  //   return db.update(
  //     'Admin',
  //     adminModel.toJson(),
  //     where: 'id = ?',
  //     whereArgs: [adminModel.id],
  //   );
  // }

  //delete User Data
  Future<int> deleteUser(int id) async {
    Database movement = await instance.database;

    return movement.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // //delete Admin Data
  // Future<int> deleteAdmin(int id) async {
  //   Database db = await instance.database;

  //   return db.delete(
  //     'Admin',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
}
