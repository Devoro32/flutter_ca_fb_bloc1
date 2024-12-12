import 'package:ca_firebase2_app/export.dart';

//?Had to chase the usecase to allow Bools
class DBFBIsLoggedInUC extends UsecaseWithoutParamFuture<bool> {
  const DBFBIsLoggedInUC(this._repository);

  final DBFBAuthenticationRepository _repository;

  @override
  ResultBool call() async => _repository.isLoggedIn();
}
