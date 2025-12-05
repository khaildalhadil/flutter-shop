import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> initDB() async {
    if (_db != null) return _db!;

    String path = join(await getDatabasesPath(), 'users.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            password TEXT
          )
        ''');
      },
    );
    return _db!;
  }

  static Future<int> insertUser(String email, String password) async {
    final db = await initDB();
    return await db.insert('users', {'email': email, 'password': password});
  }

  static Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final db = await initDB();
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if(result.isNotEmpty) {
      return result.first;
    }
    return null;
  }
}
