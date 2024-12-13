import 'package:ca_firebase2_app/export.dart';

class DBFBSignOutUC extends UsecaseWithoutParamFuture<void> {
  const DBFBSignOutUC(this._repository);

  final DBFBAuthenticationRepository _repository;

  @override
  ResultVoid call() async => _repository.signOut();
}
