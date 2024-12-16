import 'package:equatable/equatable.dart';

class AuthFBUser extends Equatable {
  const AuthFBUser({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  const AuthFBUser.empty()
      : this(
          uid: '1',
          firstName: '_empty.firstName',
          lastName: '_empty.lastName',
          email: '_empty.email',
        );

  final String uid;
  final String firstName;
  final String lastName;
  final String email;

  @override
  List<Object?> get props => [uid, firstName, lastName, email];
}
