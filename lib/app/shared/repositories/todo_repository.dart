import 'package:todo_app/app/shared/utils/database_helper.dart';
import 'package:todo_app/app/shared/models/todo_model.dart';

class TodoRepository {
  final DatabaseHelper databaseHelper;

  TodoRepository(this.databaseHelper);

  Future<List<TodoModel>> getAllTodos() async {
    final db = await databaseHelper.database;
    final result = await db.query('todos');
    return result.map((map) => TodoModel.fromJson(map)).toList();
  }

  Future<TodoModel?> getTodoById(String todoId) async {
    final db = await databaseHelper.database;
    final result =
        await db.query('todos', where: 'taskId = ?', whereArgs: [todoId]);
    if (result.isNotEmpty) {
      return TodoModel.fromJson(result.first);
    }
    return null;
  }

  Future<void> addTodo(TodoModel todo) async {
    final db = await databaseHelper.database;
    await db.insert('todos', todo.toJson());
  }

  Future<void> updateTodo(TodoModel todo) async {
    final db = await databaseHelper.database;
    await db.update('todos', todo.toJson(),
        where: 'taskId = ?', whereArgs: [todo.taskId]);
  }

  Future<void> deleteTodoById(String todoId) async {
    final db = await databaseHelper.database;
    await db.delete('todos', where: 'taskId = ?', whereArgs: [todoId]);
  }
}
