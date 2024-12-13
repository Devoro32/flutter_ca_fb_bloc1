import 'package:equatable/equatable.dart';

class AuthFBUser extends Equatable {
  const AuthFBUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  const AuthFBUser.empty()
      : this(
          id: '1',
          firstName: '_empty.firstName',
          lastName: '_empty.lastName',
          email: '_empty.email',
        );

  final String id;
  final String firstName;
  final String lastName;
  final String email;

  @override
  List<Object?> get props => [id, firstName, lastName, email];
}
