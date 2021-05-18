import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:alumnisoftwareapp/user.dart';

class AlumniDatabase {
  static final AlumniDatabase instance = AlumniDatabase._init();
  static Database _database;

  AlumniDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('users.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE $tableUsers ( 
      ${UserFields.id} $idType, 
      ${UserFields.firstName} $textType,
      ${UserFields.lastName} $textType,
      ${UserFields.email} $textType,
      ${UserFields.isAlumni} $boolType,
      ${UserFields.address} $textType,
      ${UserFields.jobTitle} $textType,
      ${UserFields.registrationDate} $textType
  )
    ''');
  }

  Future<AlumniUser> create(AlumniUser user) async {
    final db = await instance.database;

    final id = await db.insert(tableUsers, user.toJson());

    return user.copy(id: id);
  }

  Future<AlumniUser> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return AlumniUser.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUsers,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
