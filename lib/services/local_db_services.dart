import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:success/models/user.dart';

class DatabaseManager {
  DatabaseManager._();

  static final DatabaseManager instance = DatabaseManager._();
  static Database? _database;

  factory DatabaseManager() => instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'success.db'),
      onCreate: (db, version) {
        db.execute('''
   CREATE TABLE IF NOT EXISTS users (
        idLocal INTEGER PRIMARY KEY,
        id INTEGER,
        firstnameAndLastname TEXT,
        phone TEXT,
        gender TEXT,
        typeOfBac TEXT,
        bacYear TEXT,
        comeFromCountry TEXT,
        comeFromTown TEXT,
        dominantForceTemperament TEXT,
        dominantWeaknessTemperament TEXT,
        temperament TEXT,
        skills TEXT      
        
      )
  ''');
      },
      version: 1,
    );
  }

  Future<User?> getLoggedUser() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    debugPrint("----------------$maps ---------------------------");
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> addUser(User user) async {
    final Database db = await database;
    return await db.insert(
      'users',
      user.toMap(),
    );
  }

  Future<void> updateUser(User user) async {
    final Database db = await database;

    await db
        .update("users", user.toMap(), where: "idLocal = ?", whereArgs: [1]);
  }

  void deleteUser(int id) async {
    final Database db = await database;
    db.delete("users", where: "id = ?", whereArgs: [id]);
  }

  Future<void> clearDatabase() async {
    final Database db = await database;
    await db.delete('users'); // Delete all records from the 'employees' table
  }
}
