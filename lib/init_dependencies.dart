import 'package:ca_firebase2_app/export.dart';

GetIt getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //TODO: Should we separate this by features?

  //!Authentication

  //1. Services
  getIt.registerSingleton<DBFBAuthenticationRemoteDataSource>(
      const DBFBAuthRemoteDataSrcImpl());

  //2.Repository

  getIt.registerSingleton<DBFBAuthenticationRepository>(
      AuthenticationRepositoryImplementation(getIt()));

  //3:Usecase
  // getIt.registerFactory(() => DBFBSignUpUC(getIt()));
  getIt.registerSingleton<DBFBSignUpUC>(DBFBSignUpUC(getIt()));
  getIt.registerSingleton<DBFBSignInUC>(DBFBSignInUC(getIt()));
  getIt.registerSingleton<DBFBIsLoggedInUC>(DBFBIsLoggedInUC(getIt()));
  getIt.registerSingleton<DBFBSendPWUC>(DBFBSendPWUC(getIt()));
  getIt.registerSingleton<DBFBGetUserUC>(DBFBGetUserUC(getIt()));

  //4. bloc/cubit

  // getIt.registerSingleton<AuthenticationBloc>(getIt());
  // getIt.registerSingleton<AuthenticationCubit>(getIt());

  getIt.registerFactory(
      () => AuthenticationCubit(dbfbSignInUC: getIt(), dbfbSignUpUC: getIt()));
  getIt.registerFactory(() => AuthenticationBloc(
        dbfbSignUpUC: getIt(),
        dbfbsignInUC: getIt(),
      ));

  //!DB
}
