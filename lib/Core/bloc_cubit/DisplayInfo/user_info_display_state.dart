part of 'user_info_display_cubit.dart';

sealed class UserInfoDisplayState extends Equatable {
  const UserInfoDisplayState();

  @override
  List<Object> get props => [];
}

class UserInfoLoading extends UserInfoDisplayState {}

class UserInfoLoaded extends UserInfoDisplayState {
  final AuthFBUser user;
  UserInfoLoaded({required this.user});
}

class LoadUserInfoFailure extends UserInfoDisplayState {}
