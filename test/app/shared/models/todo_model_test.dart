import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app/shared/models/todo_model.dart';

void main() {
  test('TodoModel toJson() should return a valid JSON map', () {
    final todo = TodoModel(
      taskId: '1',
      userId: 'userId',
      taskTitle: 'Task Title',
      taskDescription: 'Task Description on',
      isCompleted: false,
    );

    final json = todo.toJson();

    expect(json, isMap);
    expect(json['taskId'], '1');
    expect(json['userId'], 'userId');
    expect(json['taskTitle'], 'Task Title');
    expect(json['taskDescription'], 'Task Description on');
    expect(json['isCompleted'], false);
  });

  test(
    'TodoModel fromJson() should return a valid TodoModel instance',
    () {
      final json = {
        'taskId': '1',
        'userId': 'userId',
        'taskTitle': 'Task Title',
        'taskDescription': 'Task Description on',
        'isCompleted': false
      };
      final todo = TodoModel.fromJson(json);

      expect(todo.taskId, '1');
      expect(todo.userId, 'userId');
      expect(todo.taskTitle, 'Task Title');
      expect(todo.taskDescription, 'Task Description on');
      expect(todo.isCompleted, false);
    },
  );
}
