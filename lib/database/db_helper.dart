import 'package:path/path.dart';
import 'package:shopsmart/models/cart_model.dart';
import 'package:shopsmart/models/product.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> initDB() async {
    if (_db != null) return _db!;

    String path = join(await getDatabasesPath(), 'shop.db');

    _db = await openDatabase(
      path,
      version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE users (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              email TEXT,
              password TEXT
            );
          ''');

           await db.execute('''
            CREATE TABLE products (
              id TEXT PRIMARY KEY,
              title TEXT,
              price TEXT,
              category TEXT,
              description TEXT,
              image TEXT,
              quantity TEXT
            );
          ''');

          await db.execute('''
            CREATE TABLE cart (
            cartId TEXT PRIMARY KEY,
            productId TEXT,
            quantity INTEGER
          );
          ''');

        }
    );
    return _db!;
  }

  static Future<void> insertCart(CartModel cart) async {
    final db = await initDB();
    await db.insert(
      'cart',
      cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }



  static Future<void> insertProducts(List<ProductModel> list) async {
    final db = await initDB();

    for (var p in list) {
      await db.insert(
        "products",
        p.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
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
