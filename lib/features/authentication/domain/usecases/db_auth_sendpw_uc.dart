import 'package:ca_firebase2_app/export.dart';

class DBFBSendPWUC extends UsecaseWithParams<void, DBFBSendPWUCParams> {
  const DBFBSendPWUC(this._repository);

  final DBFBAuthenticationRepository _repository;

  @override
  ResultVoid call(DBFBSendPWUCParams params) async =>
      _repository.sendPasswordResetEmail(
        params.email,
      );
}

class DBFBSendPWUCParams extends Equatable {
  const DBFBSendPWUCParams({
    required this.email,
  });

  const DBFBSendPWUCParams.empty()
      : this(
          email: '_empty.email',
        );

  final String email;

  @override
  List<Object?> get props => [email];
}
