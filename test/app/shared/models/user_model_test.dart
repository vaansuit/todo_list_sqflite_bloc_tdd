import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app/shared/models/user_model.dart';

void main() {
  test('UserModel toJson() should return a valid JSON map', () {
    final user = UserModel(
        userId: 'userId',
        userName: 'userName',
        userEmail: 'userEmail',
        userPassword: 'userPassword');

    final json = user.toJson();

    expect(json, isMap);
    expect(json['userId'], 'userId');
    expect(json['userName'], 'userName');
    expect(json['userEmail'], 'userEmail');
    expect(json['userPassword'], 'userPassword');
  });

  test('UserModel fromJson() should return a valid UserModel isntance', () {
    final json = {
      'userId': 'userId',
      'userName': 'userName',
      'userEmail': 'userEmail',
      'userPassword': 'userPassword'
    };

    final user = UserModel.fromJson(json);

    expect(user.userId, 'userId');
    expect(user.userName, 'userName');
    expect(user.userEmail, 'userEmail');
    expect(user.userPassword, 'userPassword');
  });
}
