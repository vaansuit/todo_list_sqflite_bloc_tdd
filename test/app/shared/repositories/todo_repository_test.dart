import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_app/app/shared/models/todo_model.dart';
import 'package:todo_app/app/shared/repositories/todo_repository.dart';
import 'package:todo_app/app/shared/utils/database_helper.dart';
import 'package:uuid/uuid.dart';

void main() {
  late DatabaseHelper databaseHelper;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();

    databaseHelper = DatabaseHelper();
    await databaseHelper.initializeDatabase();
  });

  test('TodoRepository Database Operations', () async {
    final todoRepository = TodoRepository(databaseHelper);
    const uuid = Uuid();

    // Adiciona um novo todo
    final todo = TodoModel(
      taskId: uuid.v4(),
      userId: 'user1',
      taskTitle: 'Task 1',
      taskDescription: 'Description 1',
      isCompleted: false,
    );
    await todoRepository.addTodo(todo);

    // Recupera todos os todos
    final todos = await todoRepository.getAllTodos();
    expect(todos.length, 1);
    expect(todos.first.taskId, todo.taskId);
    expect(todos.first.userId, todo.userId);
    expect(todos.first.taskTitle, todo.taskTitle);
    expect(todos.first.taskDescription, todo.taskDescription);
    expect(todos.first.isCompleted, todo.isCompleted);

    // Atualiza o título do todo
    final updatedTodo = TodoModel(
      taskId: todo.taskId,
      userId: todo.userId,
      taskTitle: 'Updated Title',
      taskDescription: todo.taskDescription,
      isCompleted: todo.isCompleted,
    );
    await todoRepository.updateTodo(updatedTodo);

    // Recupera o todo atualizado
    final fetchedUpdatedTodo = await todoRepository.getTodoById(todo.taskId);
    expect(fetchedUpdatedTodo, isNotNull);
    expect(fetchedUpdatedTodo!.taskId, todo.taskId);
    expect(fetchedUpdatedTodo.userId, updatedTodo.userId);
    expect(fetchedUpdatedTodo.taskTitle, updatedTodo.taskTitle);
    expect(fetchedUpdatedTodo.taskDescription, updatedTodo.taskDescription);
    expect(fetchedUpdatedTodo.isCompleted, updatedTodo.isCompleted);

    // Deleta o todo
    await todoRepository.deleteTodoById(todo.taskId);

    // Verifica se o todo foi removido do banco de dados
    final deletedTodo = await todoRepository.getTodoById(todo.taskId);
    expect(deletedTodo, isNull);
  });
}
