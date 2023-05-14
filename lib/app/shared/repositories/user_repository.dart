import 'package:todo_app/app/shared/models/user_model.dart';

import '../utils/database_helper.dart';

class UserRepository {
  final DatabaseHelper databaseHelper;

  UserRepository(this.databaseHelper);

  Future<void> addUser(UserModel user) async {
    final db = await databaseHelper.database;
    await db.insert('users', user.toJson());
  }

  Future<UserModel?> getUserById(String id) async {
    final db = await databaseHelper.database;
    final result =
        await db.query('users', where: 'userId = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    }
    return null;
  }

  Future<UserModel?> getUserByEmail(String email) async {
    final db = await databaseHelper.database;
    final result =
        await db.query('users', where: 'userEmail = ?', whereArgs: [email]);
    if (result.isNotEmpty) {
      return UserModel.fromJson(result.first);
    }
    return null;
  }

  Future<void> updateUser(UserModel user) async {
    final db = await databaseHelper.database;
    await db.update('users', user.toJson(),
        where: 'userId = ?', whereArgs: [user.userId]);
  }

  Future<void> deleteUser(String id) async {
    final db = await databaseHelper.database;
    await db.delete('users', where: 'userId = ?', whereArgs: [id]);
  }
}
