abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationLoadedState extends AuthenticationState {
  final String userId;
  AuthenticationLoadedState({
    required this.userId,
  });
}

class AuthenticationUnauthenticatedState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String errorMessage;

  AuthenticationErrorState(this.errorMessage);
}
