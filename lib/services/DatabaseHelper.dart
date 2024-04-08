import 'package:first_project/models/UserModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> connectDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'UsersData.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, studentId TEXT, password TEXT, gender TEXT, level TEXT)',
        );
      },
      version: 1,
    );
  }

  // static Future<void> insert(String table, Map<String, dynamic> data) async {
  //   final db = await DBHelper.connectDatabase();
  //   await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  static Future<void> insertUser(User user) async {
    final db = await connectDatabase();
    await db.insert(
      'Users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  static Future<List<User>> getUsers() async {
    // Get a reference to the database.
    final db = await connectDatabase();
    final List<Map<String, Object?>> userMaps = await db.query('Users');

    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'email': email as String,
            'studentId': studentId as String,
            'gender': gender as String,
            'level': level as String,
            'password': password as String,
          } in userMaps)
        User(
            name: name,
            email: email,
            studentId: studentId,
            gender: gender,
            level: level,
            password: password)
    ];
  }
}
