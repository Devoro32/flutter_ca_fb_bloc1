// import 'package:dartz/dartz.dart';
// import 'package:tdd_tutorial/core/errors/exceptions.dart';
// import 'package:tdd_tutorial/core/errors/failure.dart';
// import 'package:tdd_tutorial/core/utils/typedef.dart';
// import 'package:tdd_tutorial/src/authentication/data/datasources/authentication_remote_data_source.dart';
// import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
// import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ca_firebase2_app/export.dart';

class AuthenticationRepositoryImplementation
    implements DBFBAuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  final DBFBAuthenticationRemoteDataSource _remoteDataSource;

  @override

//TODO: Can't we replace this section with DBAuthUserCreationReqModel

  ResultVoid dbsignupRepo({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      await _remoteDataSource.dbsignupDS(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      return const Right(null);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }

  @override
  ResultVoid dssigninDS({
    required String email,
    required String password,
  }) async {
    try {
      await _remoteDataSource.dbsigninDS(email: email, password: password);
      return const Right(null);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }

  @override
  ResultVoid getUser() async {
    try {
      await _remoteDataSource.getUser();
      return const Right(null);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    bool result = await _remoteDataSource.isLoggedIn();
    return result;
  }

  @override
  ResultVoid sendPasswordResetEmail(String email) async {
    try {
      //dont need email:email because this field is not required in datasource
      await _remoteDataSource.sendPasswordResetEmail(email);
      return const Right(null);
    } catch (e) {
      return Left(DBFailure(e.toString()));
    }
  }
}
