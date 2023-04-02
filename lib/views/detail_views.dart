import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:step_2/components/DetailDivider.dart';
import 'package:step_2/components/DetailTime.dart';
import 'package:step_2/components/ReadMoreButton.dart';
import 'package:step_2/components/detail_title.dart';
import 'package:step_2/constants/api_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:step_2/models/artikl_model.dart';
import 'package:step_2/theme/app_colors.dart';
import 'package:step_2/theme/text_style.dart';
import 'package:step_2/views/home_views.dart';

class NewsDetailViews extends StatelessWidget {
  const NewsDetailViews({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primari,
        actions: article.url != null
            ? [
                IconButton(
                  onPressed: () {
                    Share.share(article.url!);
                  },
                  icon: const Icon(Icons.share),
                ),
              ]
            : null,
        leading: IconButton(
          icon: const Icon(Icons.newspaper_outlined),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          },
        ),
        title: Text(
          article.title,
          overflow: TextOverflow.fade,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(13, 17, 13, 20),
        children: [
          DetailTitle(article: article),
          const DetailDivider(),
          DetailTime(article: article.publishedAt),
          const SizedBox(height: 10),
          // Image.network(article.urlToImage ?? ApiConst.defaultImege),
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? ApiConst.defaultImege,
            placeholder: (context, url) => Image.asset("assets/news_imeg.jpg"),
            errorWidget: (context, url, error) =>
                Image.asset("assets/error_foto.jpg"),
          ),
          const SizedBox(height: 10),
          Text(article.description ?? "", style: AppTexStyle.detailDescripshin),
          const SizedBox(height: 20),
          article.url != null
              ? ReaqdMoreButton(
                  onPressed: () async {
                    final uri = Uri.parse(article.url!);
                    // print(canLaunchUrl(Uri.parse(article.url!)));
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
