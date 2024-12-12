import 'package:ca_firebase2_app/export.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationCubitState> {
  AuthenticationCubit({
    required DBFBSignUpUC dbfbSignUpUC,
    required DBFBSignInUC dbfbSignInUC,
  })  : _dbfbSignUpUC = dbfbSignUpUC,
        _dbfbSignInUC = dbfbSignInUC,
        super(const AuthenticationCubitInitial());

  final DBFBSignUpUC _dbfbSignUpUC;
  final DBFBSignInUC _dbfbSignInUC;

  Future<void> dbfbSignUpCubit({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(const CreatingUserCubit());
    final result = await _dbfbSignUpUC(SignUpUserParams(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    ));

//TODO: how does this link to the DBFailure typedef?
    result.fold((failure) => emit(AuthenticationErrorCubit(failure.message)),
        (_) => emit(const UserCreatedCubit()));
  }

  Future<void> dbfbSignInCubit({
    required String email,
    required String password,
  }) async {
    emit(const UserloadingCubit());

    final result = await _dbfbSignInUC(
      SignInUsersParams(
        email: email,
        password: password,
      ),
    );

    result.fold(
        (failure) => emit(AuthenticationErrorCubit(failure.message)),
        (_) => emit(
              const UserloginCubit(),
            ));
  }
}
