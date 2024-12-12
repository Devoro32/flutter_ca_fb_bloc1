import 'package:ca_firebase2_app/export.dart';

class DBFBSignInUC extends UsecaseWithParams<void, SignInUsersParams> {
  const DBFBSignInUC(this._repository);

  final DBFBAuthenticationRepository _repository;

  @override
  ResultVoid call(SignInUsersParams params) async => _repository.dssigninDS(
        email: params.email,
        password: params.password,
      );
}

class SignInUsersParams extends Equatable {
  const SignInUsersParams({
    required this.email,
    required this.password,
  });

  const SignInUsersParams.empty()
      : this(
          email: '_empty.email',
          password: '_empty.password',
        );

  final String email;
  final String password;

  @override
  List<Object?> get props => [email];
}
