import 'package:flutter/material.dart';
import 'package:step_2/components/news_card.dart';
import 'package:step_2/constants/text_constants.dart';

import 'package:step_2/models/topnews_model.dart';
import 'package:step_2/services/fetch_service.dart';
import 'package:step_2/theme/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TopNews? topNews;
  Future<void> fetchNews() async {
    topNews = await TopNewsRepo().fetchTopNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primari,
        leading: const Icon(Icons.newspaper_outlined),
        title: const Text(AppText.topNewsAppBartitle),
      ),
      body: topNews == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: topNews!.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final news = topNews!.articles[index];
                return CardNews(news: news);
              },
            ),
    );
  }
}
