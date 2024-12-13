import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/presentation/views/fp_todo._view.dart';

class MainPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const MainPage(),
      );
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const Text('Main Page'),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, DPTodoHomeScreen.route());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppPallete.whiteColor,
                    foregroundColor: AppPallete.errorColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                child: const Text('DP Todo home screen'))
          ],
        )),
      ),
    );
  }
}

//TODO: Sign out option on the app bar