import 'package:ca_firebase2_app/export.dart';
import 'package:ca_firebase2_app/features/DPTodo/presentation/views/dp_todo._view.dart';

//?Taken from Ecommerce
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      create: (context) => getIt<UserInfoDisplayCubit>()..displayUserInfo(),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
        child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
          builder: (context, state) {
            if (state is UserInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserInfoLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // _profileImage(state.user, context),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  // Widget _profileImage(AuthFBUser user, BuildContext context) {
  //   //TODO: Implementation of profile images
  //   return Container();
  //   // return GestureDetector(
  //   //   onTap: () {
  //   //     AppNavigator.push(context, const SettingsPage());
  //   //   },
  //   //   child: Container(
  //   //     height: 40,
  //   //     width: 40,
  //   //     decoration: BoxDecoration(
  //   //         image: DecorationImage(
  //   //             image: user.image.isEmpty
  //   //                 ? AssetImage(user.image)
  //   //                 : NetworkImage(user.image) as ImageProvider),
  //   //         color: Colors.red,
  //   //         shape: BoxShape.circle),
  //   //   ),
  //   // );
  // }
}
