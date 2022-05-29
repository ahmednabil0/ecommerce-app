import 'package:ecommerce/models/cart_product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper.internal();
  factory DbHelper() => _dbHelper;
  DbHelper.internal();
  static Database? _db;

  createDatabase() async {
    if (_db != null) {
      return _db;
    }
    String path = join(await getDatabasesPath(), 'cart.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE products(id integer primary key autoincrement,name text,img text,price double,count integer )');
    });
    return _db;
  }

  Future<int> createproduct(Cartproducts cartproducts) async {
    Database db = await createDatabase();
    return db.insert('products', cartproducts.toMap());
  }

  Future<List<Map<String, Object?>>> getAllProducts() async {
    Database db = await createDatabase();
    return db.query('products');
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> clear() async {
    Database db = await createDatabase();
    return db.delete(
      'products',
    );
  }

  Future<int> update(Cartproducts cartproducts) async {
    Database db = await createDatabase();
    return db.update('products', cartproducts.toMap(),
        where: 'id = ?', whereArgs: [cartproducts.id]);
  }
}
