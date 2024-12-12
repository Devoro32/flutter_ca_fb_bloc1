import 'package:ca_firebase2_app/export.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    //hide current snackbar to show the next snackbar
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
}
