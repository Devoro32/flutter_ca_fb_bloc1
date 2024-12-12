import 'package:equatable/equatable.dart';

class AuthFBUser extends Equatable {
  const AuthFBUser({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const AuthFBUser.empty()
      : this(
          id: '1',
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [id, name, avatar];
}
