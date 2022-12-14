import 'package:laban/model/model.product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class MyDb {
  MyDb._();
  //assign the private constructor to a static variable
  // a class owns a static variable
  static final MyDb db = MyDb._();

  static Database? _database;
  Future<Database> get database async {
    return _database ??= await init();
  }

  //-------Initialize the database----------
  Future<Database> init() async {
    //get the path using getDatabasesPath()
    return await openDatabase(
      join(await getDatabasesPath(), "cart.db"),
      onCreate: (db, version) {
        db.execute('CREATE TABLE Cart (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price TEXT, category TEXT, description TEXT, image TEXT,disc TEXT,count INT, shippingFee INTEGER)');
      },
      version: 1,
    );
  }

  //---------Get the data from the database-------
  getDatabaseInfo() async {
    var db = await database;
    var info = await db.query("cart");
    if (info.isEmpty) {
      return null;
    } else {
      return info;
    }
  }

  addDatabase(Product product,int count) async {
    var db = await database;
    await db.insert("cart", product.toMap(product, count),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // toUpdate(int id, Product product) async {
  //   var db = await database;
  //   await db.update('note', product.toMap(product), where: 'id = ?', whereArgs: [id]);
  // }

  toDelete() async {
    var db = await database;
    // await db.delete('note', where: 'id = ?', whereArgs: [id]);
    await db.rawDelete('DELETE FROM cart');
  }
}