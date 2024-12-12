import 'dart:convert';

// import 'package:tdd_tutorial/core/utils/typedef.dart';
// import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';

import 'package:ca_firebase2_app/export.dart';

class CAFBUserModel extends AuthFBUser {
  const CAFBUserModel({
    required super.avatar,
    required super.id,
    required super.createdAt,
    required super.name,
  });

  const CAFBUserModel.empty()
      : this(
          id: '1',
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  factory CAFBUserModel.fromJson(String source) =>
      CAFBUserModel.fromMap(jsonDecode(source) as DataMap);

  CAFBUserModel.fromMap(DataMap map)
      : this(
          avatar: map['avatar'] as String,
          id: map['id'] as String,
          createdAt: map['createdAt'] as String,
          name: map['name'] as String,
        );

  CAFBUserModel copyWith({
    String? avatar,
    String? id,
    String? createdAt,
    String? name,
  }) {
    return CAFBUserModel(
      avatar: avatar ?? this.avatar,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
    );
  }

  DataMap toMap() => {
        'id': id,
        'avatar': avatar,
        'createdAt': createdAt,
        'name': name,
      };

  String toJson() => jsonEncode(toMap());
}
