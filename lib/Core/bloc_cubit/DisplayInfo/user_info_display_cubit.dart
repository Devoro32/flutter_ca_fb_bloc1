import 'package:ca_firebase2_app/export.dart';
part 'user_info_display_state.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit({
    required DBFBGetUserUC dbfbGetUserUC,
  })  : _dbfbGetUserUC = dbfbGetUserUC,
        super(UserInfoLoading());

  DBFBGetUserUC _dbfbGetUserUC;

  void displayUserInfo() async {
    var returnedData = await _dbfbGetUserUC();

    print('Return data: ${returnedData}');
    returnedData.fold((error) {
      emit(LoadUserInfoFailure());
    }, (data) {
      emit(UserInfoLoaded(user: data));
    });

    returnedData.fold((failure) => emit(LoadUserInfoFailure()),
        (data) => emit(UserInfoLoaded(user: data)));
  }
}
