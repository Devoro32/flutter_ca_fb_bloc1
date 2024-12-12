//usecase from the Blog
// abstract interface class UseCase<SuccessType, Params> {
//   Future<Either<Failure, SuccessType>> call(Params params);
// }

// class NoParams {}

//TODO: Place the EITHER in the USECASE like Blog
abstract interface class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

// class NoParams {}
