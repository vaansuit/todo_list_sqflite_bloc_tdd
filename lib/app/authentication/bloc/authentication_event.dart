import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class UserLoggedIn extends AuthenticationEvent {
  final String token;

  const UserLoggedIn(this.token);

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'UserLoggedIn {token: $token}';
}

class UserLoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'UserLoggedOut';
}
