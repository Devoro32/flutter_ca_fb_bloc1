import 'package:ca_firebase2_app/export.dart';

class TaskTabSelectionCubit extends Cubit<int> {
  TaskTabSelectionCubit() : super(0);

  int selectedIndex = 0;

  void selectedTab(int index) {
    selectedIndex = index;
    emit(selectedIndex);
  }
}
