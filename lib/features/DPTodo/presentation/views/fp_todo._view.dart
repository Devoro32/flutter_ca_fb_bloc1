import 'package:ca_firebase2_app/export.dart';

class DPTodoHomeScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const DPTodoHomeScreen());
  const DPTodoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.greyColor,
        title: Text('DP To Do Home Screen'),
        actions: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(const DBFBSignOutEvent());
                    Navigator.pushReplacement(context, SignInPage.route());
                    print('Signout button clicked');
                  },
                  icon: const Icon(Icons.exit_to_app));
            },
          ),
        ],
      ),
      body: SafeArea(child: Column()),
    );
  }
}
