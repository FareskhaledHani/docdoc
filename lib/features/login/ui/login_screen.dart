


import 'package:docdoc/features/login/ui/widgets/alreedy_have_account.text.dart';
import 'package:docdoc/features/login/ui/widgets/email_and_password.dart';
import 'package:docdoc/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:docdoc/features/login/ui/widgets/terms_And_condition_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../data/models/login_request_body.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 30.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyles.font24BlueBold
                ),verticalSpacing(8),
                Text(
                    "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                    style: TextStyles.font14GrayRegular
                ),
                verticalSpacing(8),
                Column(
                  children: [
                  const EmailAndPassword(),
                    verticalSpacing(24),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text('Forget Password?', style: TextStyles.font13BlueRegular)),
                    verticalSpacing(40),
                     AppTextButton(buttonText: 'Login', textStyle: TextStyles.font16WhiteSemiBold, onPressed: () {
                       validateThenDoLoin(context);
                     }),
                    verticalSpacing(40),
                    Row(
                      children: [
                        Divider(
                          height: 7,
                          thickness: 4,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    verticalSpacing(16),
                    TermsAndConditionsText(),
                    verticalSpacing(40),
                    DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void validateThenDoLoin(BuildContext context) {
    if(context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text
      ));
    }

  }
}
