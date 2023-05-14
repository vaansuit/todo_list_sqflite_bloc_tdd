import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _dbInstance = DatabaseHelper.internal();
  static late Database _database;

  factory DatabaseHelper() => _dbInstance;

  DatabaseHelper.internal();

  Future<Database> get database async {
    return _database;
  }

  Future<void> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'todo_app.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        userId TEXT PRIMARY KEY,
        userName TEXT,
        userEmail TEXT,
        userPassword TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS todos (
        taskId TEXT PRIMARY KEY, 
        userId TEXT, 
        taskTitle TEXT,
        taskDescription TEXT,
        isCompleted INTEGER
      )
    ''');
  }
}
