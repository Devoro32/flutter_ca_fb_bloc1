import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/dp_todo_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO: Can't this be moved into initializedependencies?
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getIt<AuthenticationBloc>(),
      ),
      BlocProvider(create: (_) => getIt<AuthenticationCubit>()),
      BlocProvider(create: (context) => TaskTabSelectionCubit()),
      BlocProvider(create: (context) => getIt<DptodoBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false,
      home: const SignInPage(),
    );
  }
}
