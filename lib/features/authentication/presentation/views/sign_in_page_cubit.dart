import 'package:ca_firebase2_app/export.dart';

class SignInPageCubit extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignInPageCubit(),
      );
  const SignInPageCubit({super.key});

  @override
  State<SignInPageCubit> createState() => _SignInPageCubitState();
}

class _SignInPageCubitState extends State<SignInPageCubit> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthenticationCubit, AuthenticationCubitState>(
          listener: (context, state) {
            if (state is AuthenticationErrorCubit) {
              showSnackBar(context, state.message);
            } else if (state is UserloginCubit) {
              Navigator.pushAndRemoveUntil(
                context,
                MainPage.route(),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            if (state is UserloadingCubit) {
              return const Loader();
            }

            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In.',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AuthField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObscureText: true,
                  ),
                  const SizedBox(height: 20),
                  AuthGradientButton(
                    buttonText: 'Sign in',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthenticationCubit>().dbfbSignInCubit(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SignUpPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
