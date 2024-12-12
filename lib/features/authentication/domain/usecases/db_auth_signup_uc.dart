import 'package:ca_firebase2_app/export.dart';

class DBFBSignUpUC extends UsecaseWithParams<void, SignUpUserParams> {
  const DBFBSignUpUC(this._repository);

  final DBFBAuthenticationRepository _repository;
  @override
  ResultVoid call(SignUpUserParams params) async => _repository.dbsignupRepo(
        firstName: params.firstName,
        email: params.email,
        lastName: params.lastName,
        password: params.password,
      );
}

class SignUpUserParams extends Equatable {
  const SignUpUserParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  const SignUpUserParams.empty()
      : this(
          firstName: '_empty.firstName',
          lastName: '_empty.lastName',
          email: '_empty.email',
          password: '_empty.password',
        );

  final String firstName;
  final String lastName;
  final String email;
  final String password;

  @override
  List<Object?> get props => [firstName, lastName, email];
}
