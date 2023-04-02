import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:step_2/constants/api_constants.dart';
import 'package:step_2/models/artikl_model.dart';
import 'package:step_2/theme/app_colors.dart';
import 'package:step_2/theme/text_style.dart';
import 'package:step_2/views/detail_views.dart';

class CardNews extends StatelessWidget {
  const CardNews({
    super.key,
    required this.news,
  });

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primari,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailViews(article: news),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                // child: Image.network(
                //   news.urlToImage ?? ApiConst.defaultImege,
                //   fit: BoxFit.fitWidth,
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? ApiConst.defaultImege,
                  placeholder: (context, url) =>
                      Image.asset("assets/news_imeg.jpg"),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/error_foto.jpg"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    news.title,
                    style: AppTexStyle.newsTextstyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
