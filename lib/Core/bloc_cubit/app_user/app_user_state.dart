part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {}

//state indicate the user is logged out
final class AppUserInitial extends AppUserState {}

//indicate the user is logged in
final class AppUserLoggedIn extends AppUserState {
  final AuthFBUser user;
  AppUserLoggedIn(this.user);
}


//core  cannot depend on other features
//other features can depend on core