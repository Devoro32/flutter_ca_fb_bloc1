import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

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
  getIt.registerSingleton<DBFBSignOutUC>(DBFBSignOutUC(getIt()));

  //4. bloc/cubit

  // getIt.registerSingleton<AuthenticationBloc>(getIt());
  // getIt.registerSingleton<AuthenticationCubit>(getIt());

  getIt.registerFactory(
      () => AuthenticationCubit(dbfbSignInUC: getIt(), dbfbSignUpUC: getIt()));
  getIt.registerFactory(() => AuthenticationBloc(
        dbfbSignUpUC: getIt(),
        dbfbsignInUC: getIt(),
        dbfbSignOutUC: getIt(),
      ));
  getIt.registerFactory(() => UserInfoDisplayCubit(dbfbGetUserUC: getIt()));
  //!DB

  //!Dear Programmer Todo List

//services
  getIt.registerSingleton<DPTodoDataServices>(DPTodoDataServicesImpl());

  //repository
  getIt.registerSingleton<DPtodoRepo>(DPtodoRepoImpl(getIt()));

  //usecases
  getIt.registerSingleton<DpUpdateTodoUC>(DpUpdateTodoUC(getIt()));
  getIt.registerSingleton<DpUpdateTodoStatusUC>(DpUpdateTodoStatusUC(getIt()));
  getIt.registerSingleton<DpDeleteTodoUC>(DpDeleteTodoUC(getIt()));
  getIt.registerSingleton<DpAddTodoUC>(DpAddTodoUC(getIt()));
  getIt.registerSingleton<DpGetTodoUC>(DpGetTodoUC(getIt()));
  getIt.registerSingleton<DpGetCompletedTodoUC>(DpGetCompletedTodoUC(getIt()));

  //Bloc/Cubit

  getIt.registerFactory(() => DptodoBloc(
        dpAddTodoUC: getIt(),
        dpDeleteTodoUC: getIt(),
        dpUpdateTodoStatusUC: getIt(),
        dpUpdateTodoUC: getIt(),
      ));
}
