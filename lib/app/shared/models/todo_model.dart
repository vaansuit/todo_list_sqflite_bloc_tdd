class TodoModel {
  final String taskId;
  final String userId;
  final String taskTitle;
  final String taskDescription;
  final bool isCompleted;

  TodoModel({
    required this.taskId,
    required this.userId,
    required this.taskTitle,
    required this.taskDescription,
    this.isCompleted = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      taskId: json['taskId'],
      userId: json['userId'],
      taskTitle: json['taskTitle'],
      taskDescription: json['taskDescription'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'userId': userId,
      'taskTitle': taskTitle,
      'taskDescription': taskDescription,
      'isCompleted': isCompleted,
    };
  }
}
