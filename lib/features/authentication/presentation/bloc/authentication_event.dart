part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class DBFBSignUpEvent extends AuthenticationEvent {
  const DBFBSignUpEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;

  @override
  List<Object> get props => [firstName, lastName, email, password];
}

class DBFBSignInEvent extends AuthenticationEvent {
  const DBFBSignInEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [
        email,
      ];
}
