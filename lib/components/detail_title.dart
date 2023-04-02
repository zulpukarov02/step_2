import 'package:flutter/material.dart';
import 'package:step_2/models/artikl_model.dart';
import 'package:step_2/theme/text_style.dart';

class DetailTitle extends StatelessWidget {
  const DetailTitle({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Text(
      article.title,
      textAlign: TextAlign.center,
      style: AppTexStyle.newsDetailStyle,
    );
  }
}
