import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workers/app_constance/strings_manager.dart';
import 'package:workers/generated/assets.dart';
import 'package:workers/view/screens/auth/login_screen.dart';
import 'package:workers/view/screens/home/home_screen/home_screen.dart';
import 'package:workers/view/screens/login_error_screen.dart';
import 'package:workers/view_model/auth_cubit/auth_cubit.dart';

import '../../../view_model/auth_cubit/auth_state.dart';

class UserLoginStates extends StatelessWidget {
  const UserLoginStates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..getUserData(context),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          AuthCubit cubit = BlocProvider.of(context);
          return StreamBuilder(
              stream: cubit.auth.authStateChanges(),
              builder: (context, userSnapshot) {
                if (userSnapshot.data == null) {
                  return const LoginScreen();
                }
                else if (userSnapshot.hasData) {
                  return const HomeScreen();
                }
                else if (userSnapshot.hasError) {
                  return const EmptyScreen(
                      text: AppStrings.errorMessage,
                      image: Assets.imagesNoNews);
                }
                return const Scaffold(
                  body: Center(
                    child: Text('Restart The App'),
                  ),
                );
              }
          );
        },
      ),
    );
  }
}
