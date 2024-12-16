// import 'package:flutter/cupertino.dart';
// import 'package:tdd_tutorial/core/errors/exceptions.dart';
// import 'package:tdd_tutorial/core/utils/constants.dart';
// import 'package:tdd_tutorial/core/utils/typedef.dart';

import 'package:ca_firebase2_app/export.dart';
import 'package:fpdart/fpdart.dart';

abstract class DBFBAuthenticationRemoteDataSource {
//TODO: can replace this section with DBAuthUserCreationReqModel user
  Future<Either> dbsignupDS({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<Either> dbsigninDS({
    required String email,
    required String password,
  });

  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  ResultFuture<AuthFBUser> getUser();
  Future<Either> signOut();
}

class DBFBAuthRemoteDataSrcImpl implements DBFBAuthenticationRemoteDataSource {
  const DBFBAuthRemoteDataSrcImpl();

  @override
  //TODO: can replace this section with DBAuthUserCreationReqModel user
  Future<Either> dbsignupDS({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String uid = '',
  }) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              // email: user.email!, password: user.password!);
              email: email,
              password: password);

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
        /* 'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email, */
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'uid': returnedData.user!.uid,
      });

      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

  @override
  //TODO: From ecommerced uses UserSigninReq
  Future<Either> dbsigninDS({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        //TODO: From ecommerced uses UserSigninReq
        // email: user.email!, password: user.password!
        email: email,
        password: password,
      );
      return const Right('Sign in was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'Not user found for this email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Password reset email is sent');
    } catch (e) {
      return const Left('Please try again');
    }
  }

//TODO: need to enable persisten login from Ecommerce
  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

//TODO: need to enable persisten login from Ecommerce
  @override
  ResultFuture<CAFBUserModel> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser?.uid)
          .get()
          .then((value) => value.data());
      return Right(CAFBUserModel.fromJson(userData.toString()));
    } catch (e) {
      return const Left(DBFailure('Please try again'));
    }
  }

  Future<Either> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return const Right('Sign out');
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }
}
