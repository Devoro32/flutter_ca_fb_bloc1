part of 'authentication_cubit.dart';

abstract class AuthenticationCubitState extends Equatable {
  const AuthenticationCubitState();

  @override
  List<Object> get props => [];
}

class AuthenticationCubitInitial extends AuthenticationCubitState {
  const AuthenticationCubitInitial();
}

//? User creation state

class CreatingUserCubit extends AuthenticationCubitState {
  const CreatingUserCubit();
}

class UserCreatedCubit extends AuthenticationCubitState {
  const UserCreatedCubit();
}

//?User Login states
class UserloginCubit extends AuthenticationCubitState {
  const UserloginCubit();
}

//fetching the user on the sign in screen
class UserloadingCubit extends AuthenticationCubitState {
  const UserloadingCubit();
}

//?Generic usage states
class AuthenticationErrorCubit extends AuthenticationCubitState {
  const AuthenticationErrorCubit(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
