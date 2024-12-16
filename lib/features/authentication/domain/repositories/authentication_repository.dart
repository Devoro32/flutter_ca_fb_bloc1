// import 'package:tdd_tutorial/core/utils/typedef.dart';
// import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
import 'package:ca_firebase2_app/export.dart';
import 'package:fpdart/fpdart.dart';

abstract class DBFBAuthenticationRepository {
  const DBFBAuthenticationRepository();

  //TODO: Can use type def and DBAuthUserCreationReqModel
  ResultVoid dbsignupRepo({
    required String firstName,
    required String email,
    required String lastName,
    required String password,
  });
  ResultVoid dssigninDS({
    required String email,
    required String password,
  });

  ResultVoid sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  ResultVoid signOut();

  //   Future<Either> sendPasswordResetEmail(String email);
  // Future<bool> isLoggedIn();
  // Future<Either> getUser();
}
