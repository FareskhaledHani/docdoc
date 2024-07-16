import 'package:docdoc/core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({super.key, required this.hasLowerCamelCase, required this.hasUpperCamelCase, required this.hasNumber, required this.hasSpecialChar, required this.hasMinLength});
  final bool hasLowerCamelCase ;
  final bool hasUpperCamelCase ;
  final bool hasNumber ;
  final bool hasSpecialChar ;
  final bool hasMinLength ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        buildValidationRow('At least 1 lowercase letter',hasLowerCamelCase),
        verticalSpacing(2),
        buildValidationRow('At least 1 uppercase letter',hasUpperCamelCase),
        verticalSpacing(2),
        buildValidationRow('At least 1 special character',hasSpecialChar),
        verticalSpacing(2),
        buildValidationRow('At least 1 number',hasNumber),
        verticalSpacing(2),
        buildValidationRow('At least 8 characters longer',hasMinLength),
        verticalSpacing(2),

      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpacing(10),
        Text(text,
            style: TextStyles.font13BlueRegular.copyWith(
          decoration:hasValidated ? TextDecoration.lineThrough:null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? ColorsManager.gray :ColorsManager.darkBlue
        )),

      ],
    );
  }
}
