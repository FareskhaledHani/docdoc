import 'package:docdoc/features/login/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  bool hasLowerCamelCase = false;
  bool hasUpperCamelCase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  bool isObscureText = true;

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCamelCase= AppRegex.hasLowerCamelCase(passwordController.text);
        hasUpperCamelCase =AppRegex.hasUpperCamelCase(passwordController.text);
        hasNumber =AppRegex.hasNumber(passwordController.text);
        hasSpecialChar= AppRegex.hasSpecialChar(passwordController.text);
        hasMinLength =AppRegex.hasMinLength(passwordController.text);
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(children:  [
      AppTextFormField(hintText: 'Email',
        validator: (value ) {
        if (value == null || value.isEmpty|| !AppRegex.hasMinLength(value)) {
          return 'Please enter email';
        }
        },
      controller: context.read<LoginCubit>().emailController,
      ),
      verticalSpacing(18),
      AppTextFormField(hintText: 'Password',
        isObscureText: isObscureText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscureText = !isObscureText;
            });
          },
          child: Icon(
            isObscureText
                ? Icons.visibility_off
                : Icons.visibility,
          ),

        ), controller: context.read<LoginCubit>().passwordController,
        validator: (value ) {
          if (value == null || value.isEmpty ) {
            return 'Please enter password';
          }
        },
      ),
      verticalSpacing(24),
      PasswordValidation(
        hasLowerCamelCase: hasLowerCamelCase,
        hasUpperCamelCase: hasUpperCamelCase,
        hasNumber: hasNumber,
        hasSpecialChar: hasSpecialChar,
        hasMinLength: hasMinLength,
      )
    ]),
    );
  }



  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

}
