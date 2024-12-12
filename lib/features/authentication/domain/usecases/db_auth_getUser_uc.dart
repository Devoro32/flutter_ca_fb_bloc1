import 'package:ca_firebase2_app/export.dart';

class DBFBGetUserUC extends UsecaseWithoutParams<void> {
  const DBFBGetUserUC(this._repository);

  final DBFBAuthenticationRepository _repository;

  @override
  ResultVoid call() async => _repository.getUser();
}
