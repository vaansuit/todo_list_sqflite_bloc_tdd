import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/app/authentication/bloc/authentication_state.dart';

void main() {
  group('Authentication State', () {
    test('AuthenticationInitialState should be initialized correctly', () {
      final state = AuthenticationInitialState();

      expect(state, isA<AuthenticationState>());
      expect(state, isA<AuthenticationInitialState>());
    });

    test(
      'AuthenticationLoadingState should be initialized correctly',
      () {
        final state = AuthenticationLoadingState();

        expect(state, isA<AuthenticationState>());
        expect(state, isA<AuthenticationLoadingState>());
      },
    );
  });
}
