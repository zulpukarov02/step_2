import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:step_2/theme/app_colors.dart';
import 'package:step_2/theme/text_style.dart';

class DetailTime extends StatelessWidget {
  const DetailTime({
    super.key,
    required this.article,
  });

  final String article;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat(" d MMM, y.H:m").format(DateTime.parse(article));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.access_time,
          color: AppColors.blackDetails,
          size: 30,
        ),
        Text(
          time,
          style: AppTexStyle.timeDate,
        ),
      ],
    );
  }
}
