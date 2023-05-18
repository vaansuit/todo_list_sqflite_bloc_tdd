import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app/authentication/bloc/authentication_event.dart';

void main() {
  group(
    'AuthenticationEvent',
    () {
      test(
        'AppStarted event should be initialized correctly',
        () {
          final event = AppStarted();

          expect(event, isA<AuthenticationEvent>());
          expect(event, isA<AppStarted>());
          expect(event.toString(), equals('AppStarted'));
        },
      );

      test(
        'UserLoggedIn event should be initialized correctly',
        () {
          const token = 'abc123';
          final event = UserLoggedIn(token);

          expect(event, isA<AuthenticationEvent>());
          expect(event, isA<UserLoggedIn>());
          expect(event.token, equals('UserLoggedIn {token: $token}'));
        },
      );
    },
  );
}
