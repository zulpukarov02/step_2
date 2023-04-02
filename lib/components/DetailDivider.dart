import 'package:flutter/material.dart';
import 'package:step_2/theme/app_colors.dart';

class DetailDivider extends StatelessWidget {
  const DetailDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.blackDetails,
      height: 40.5,
      thickness: 2.5,
    );
  }
}
