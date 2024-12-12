import 'dart:async';
import 'package:ca_firebase2_app/export.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
// import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';
// import 'package:tdd_tutorial/src/authentication/domain/usecases/get_users.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required DBFBSignUpUC dbfbSignUpUC,
    required DBFBSignInUC dbfbsignInUC,
  })  : _dbfbSignUpUC = dbfbSignUpUC,
        _dbfbSignInUC = dbfbsignInUC,
        super(const AuthenticationInitial()) {
    on<DBFBSignUpEvent>(_dbfbSignUpHandler);
    on<DBFBSignInEvent>(_dbfbSignInHandler);
  }
  final DBFBSignUpUC _dbfbSignUpUC;
  final DBFBSignInUC _dbfbSignInUC;

  Future<void> _dbfbSignUpHandler(
      DBFBSignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(const CreatingUser());
    final result = await _dbfbSignUpUC(SignUpUserParams(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password));

    result.fold((failure) => emit(AuthenticationError(failure.message)),
        (_) => emit(const UserCreated()));
  }

  Future<void> _dbfbSignInHandler(
      DBFBSignInEvent event, Emitter<AuthenticationState> emit) async {
    emit(const AuthLoading());
    final result = await _dbfbSignInUC(
      SignInUsersParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold((failure) => emit(AuthenticationError(failure.message)),
        (_) => emit(const AuthSuccess()));
  }
}