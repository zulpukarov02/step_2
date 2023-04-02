import 'package:flutter/material.dart';
import 'package:step_2/constants/text_constants.dart';
import 'package:step_2/theme/app_colors.dart';

class ReaqdMoreButton extends StatelessWidget {
  const ReaqdMoreButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primari,
      ),
      child: Text(AppText.readMore),
    );
  }
}
