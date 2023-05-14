import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_app/app/shared/utils/database_helper.dart';

void main() {
  late DatabaseHelper databaseHelper;

  setUp(() {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();

    databaseHelper = DatabaseHelper();
  });

  test('Initialize Database', () async {
    await databaseHelper.initializeDatabase();

    //Verifica se o objeto retornado do banco de dados não é nulo
    expect(await databaseHelper.database, isNotNull);

    //Verificar se o objeto do banco de dados é uma inst}ancia do Database
    expect(await databaseHelper.database, isA<Database>());

    //Verifica se as tabelas foram criadas corretamente, comparando nome e a quantidade de tabelas
    //Obtém o objeto Database
    final db = await databaseHelper.database;

    //Verifica se as tabelas foram criadas corretamente, comparando nome e a quantidade de tabelas
    final tables = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name IN ('users', 'todos')");
    expect(tables, hasLength(2));
    expect(tables[0]['name'], 'users');
    expect(tables[1]['name'], 'todos');
  });
}
