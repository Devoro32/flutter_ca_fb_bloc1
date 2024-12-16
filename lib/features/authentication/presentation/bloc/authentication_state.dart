part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class CreatingUser extends AuthenticationState {
  const CreatingUser();
}

class GettingUsers extends AuthenticationState {
  const GettingUsers();
}

class UserCreated extends AuthenticationState {
  const UserCreated();
}

class AuthSuccess extends AuthenticationState {
  const AuthSuccess();
}

class AuthLoading extends AuthenticationState {
  const AuthLoading();
}

class UsersLoaded extends AuthenticationState {
  const UsersLoaded(this.users);

  final List<AuthFBUser> users;

  @override
  List<Object> get props => users.map((user) => user.uid).toList();
}

class AuthenticationError extends AuthenticationState {
  const AuthenticationError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
