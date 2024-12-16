import 'package:ca_firebase2_app/export.dart';
import 'package:fpdart/fpdart.dart';

//TODO: Can we use AuthFBUser insteads from blog?
class DBFBGetUserUC implements UsecaseWithoutParamFuture<dynamic> {
  const DBFBGetUserUC(this._repository);

  final DBFBAuthenticationRepository _repository;

  @override
  Future<Either> call() async => _repository.getUser();
}


//? From Blog
// class CurrentUser implements UseCase<BlogUser, NoParams> {
//   final AuthRepository authRepository;
//   CurrentUser(this.authRepository);

//   @override
//   Future<Either<Failure, BlogUser>> call(NoParams params) async {
//     return await authRepository.currentUser();
//   }
// }
