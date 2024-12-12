import 'package:ca_firebase2_app/export.dart';

class MainPage extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const MainPage(),
      );
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Text('Main Page'),
          ],
        )),
      ),
    );
  }
}
