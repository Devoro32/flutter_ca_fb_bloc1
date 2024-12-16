import 'dart:convert';

// import 'package:tdd_tutorial/core/utils/typedef.dart';
// import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';

import 'package:ca_firebase2_app/export.dart';

class CAFBUserModel extends AuthFBUser {
  CAFBUserModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.uid,
  });

  CAFBUserModel.empty()
      : this(
          uid: '1',
          firstName: '_empty.createdAt',
          lastName: '_empty.name',
          email: '_empty.avatar',
        );

  factory CAFBUserModel.fromJson(String source) =>
      CAFBUserModel.fromMap(jsonDecode(source) as DataMap);

  CAFBUserModel.fromMap(DataMap map)
      : this(
          firstName: map['firstName'] as String,
          lastName: map['lastName'] as String,
          email: map['email'] as String,
          uid: map['uid'] as String,
        );

  CAFBUserModel copyWith({
    String? firstName,
    String? uid,
    String? lastName,
    String? email,
  }) {
    return CAFBUserModel(
      firstName: firstName ?? this.firstName,
      uid: uid ?? this.uid,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  DataMap toMap() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      };

  String toJson() => jsonEncode(toMap());
}
