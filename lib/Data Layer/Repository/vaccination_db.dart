import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/MOHVaccinationModel.dart';
import '../Model/UserVaccinationModel.dart';

class Vaccination {
  Vaccination._privateContructor();

  static final Vaccination instance = Vaccination._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.vaccination');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database vaccination, int version) async {
    await vaccination.execute(' '
        ' CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,phonenum TEXT,address TEXT,dependentID TEXT) '
        ' ');

    await vaccination.execute(' '
        ' CREATE TABLE AdminVac(id INTEGER PRIMARY KEY AUTOINCREMENT,dosenum INTEGER,date TEXT,time TEXT,venue TEXT) '
        ' ');
  }

  //add User data
  Future<int> addUser(UserModel userModel) async {
    Database vaccination = await instance.database;
    return await vaccination.insert('User', userModel.toJson());
  }

  //add Admin data
  Future<int> addAdmin(AdminVacModel adminVacModel) async {
    Database vaccination = await instance.database;
    return await vaccination.insert('AdminVac', adminVacModel.toJson());
  }

  //get all User data
  Future<List<UserModel>> getAllUserData() async {
    Database vaccination = await instance.database;
    final userModel = await vaccination.query('User', orderBy: 'id');
    return userModel.map((json) => UserModel.fromJson(json)).toList();
  }

  //get all Admin data
  Future<List<AdminVacModel>> getAllAdminData() async {
    Database vaccination = await instance.database;
    final adminVacModel = await vaccination.query('AdminVac', orderBy: 'id');
    return adminVacModel.map((json) => AdminVacModel.fromJson(json)).toList();
  }

  //get specific user data
  Future<UserModel> getSpecificUserData(int id) async {
    Database vaccination = await instance.database;
    final userData = await vaccination.query('User',
        columns: ['id', 'name', 'phonenum', 'address', 'dependentID'],
        where: 'id = ?',
        whereArgs: [id]);

    if (userData.isNotEmpty) {
      return UserModel.fromJson(userData.first);
    }

    throw Exception('ID not found');
  }

  //get specific admin data
  Future<AdminVacModel> getSpecificAdminData(int id) async {
    Database vaccination = await instance.database;
    final adminData = await vaccination.query('AdminVac',
        columns: ['id', 'dosenum', 'date', 'time', 'venue'],
        where: 'id = ?',
        whereArgs: [id]);

    if (adminData.isNotEmpty) {
      return AdminVacModel.fromJson(adminData.first);
    }

    throw Exception('ID not found');
  }

  //update User Data
  Future<int> updateUser(UserModel userModel) async {
    Database vaccination = await instance.database;

    return vaccination.update(
      'User',
      userModel.toJson(),
      where: 'id = ?',
      whereArgs: [userModel.id],
    );
  }

  //update Admin Data
  Future<int> updateAdmin(AdminVacModel adminVacModel) async {
    Database vaccination = await instance.database;

    return vaccination.update(
      'AdminVac',
      adminVacModel.toJson(),
      where: 'id = ?',
      whereArgs: [adminVacModel.id],
    );
  }

  //delete User Data
  Future<int> deleteUser(int id) async {
    Database vaccination = await instance.database;

    return vaccination.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //delete Admin Data
  Future<int> deleteAdmin(int id) async {
    Database vaccination = await instance.database;

    return vaccination.delete(
      'AdminVac',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
