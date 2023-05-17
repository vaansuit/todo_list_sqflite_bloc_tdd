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

    test(
      'AuthenticationLoadedState should be initialized correctly',
      () {
        const userId = 'user123';
        final state = AuthenticationLoadedState(userId: userId);

        expect(state, isA<AuthenticationState>());
        expect(state, isA<AuthenticationLoadedState>());
        expect(state.userId, equals(userId));
      },
    );

    test(
      'AuthenticationUnauthenticatedState should be initialized correctly',
      () {
        final state = AuthenticationUnauthenticatedState();

        expect(state, isA<AuthenticationState>());
        expect(state, isA<AuthenticationUnauthenticatedState>());
      },
    );

    test(
      'AuthenticationErrorState should be initialized correctly',
      () {
        const errorMessage = 'Authentication failed';
        final state = AuthenticationErrorState(errorMessage);

        expect(state, isA<AuthenticationState>());
        expect(state, isA<AuthenticationErrorState>());
        expect(state.errorMessage, equals(errorMessage));
      },
    );
  });
}
