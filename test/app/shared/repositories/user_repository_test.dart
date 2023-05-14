import 'package:flutter_test/flutter_test.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_app/app/shared/models/user_model.dart';
import 'package:todo_app/app/shared/repositories/user_repository.dart';
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

  test('UserRepository Database Operations', () async {
    final userRepository = UserRepository(databaseHelper);
    const uuid = Uuid();

    // Adiciona um novo usuário
    final user = UserModel(
      userId: uuid.v4(),
      userName: 'John Doe',
      userEmail: 'john.doe@example.com',
      userPassword: 'password',
    );
    await userRepository.addUser(user);

    // Recupera o usuário pelo ID
    final fetchedUser = await userRepository.getUserById(user.userId);
    expect(fetchedUser, isNotNull);
    expect(fetchedUser!.userId, user.userId);
    expect(fetchedUser.userName, user.userName);
    expect(fetchedUser.userEmail, user.userEmail);
    expect(fetchedUser.userPassword, user.userPassword);

    // Atualiza o nome do usuário
    final updatedUser = UserModel(
      userId: user.userId,
      userName: 'Updated Name',
      userEmail: user.userEmail,
      userPassword: user.userPassword,
    );
    await userRepository.updateUser(updatedUser);

    // Recupera o usuário atualizado
    final fetchedUpdatedUser = await userRepository.getUserById(user.userId);
    expect(fetchedUpdatedUser, isNotNull);
    expect(fetchedUpdatedUser!.userId, user.userId);
    expect(fetchedUpdatedUser.userName, updatedUser.userName);
    expect(fetchedUpdatedUser.userEmail, updatedUser.userEmail);
    expect(fetchedUpdatedUser.userPassword, updatedUser.userPassword);

    // Deleta o usuário
    await userRepository.deleteUser(user.userId);

    // Verifica se o usuário foi removido do banco de dados
    final deletedUser = await userRepository.getUserById(user.userId);
    expect(deletedUser, isNull);
  });
}
