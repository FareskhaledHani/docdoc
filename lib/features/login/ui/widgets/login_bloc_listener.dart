import 'package:docdoc/core/helpers/extentions.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/features/login/logic/login_cubit.dart';
import 'package:docdoc/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:(previous, current) {
      return  current is Loading || current is Error || current is Success;
      },
      listener: (context, state) {
        // TODO: implement listener
        state.whenOrNull(
          loading: () {
            showDialog(context: context, builder: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              );
            });

        },
            failure: (error) {
            context.pop();
            setupErrorState(context, error);
        },
        success: (LoginResponse) {
        context.pop();
        context.pushNamed(Routes.homeScreen);
        }


        );
      },
      child: SizedBox.shrink(),
    );
  }
  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
