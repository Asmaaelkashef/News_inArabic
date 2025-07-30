import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_list_view.dart';
import 'package:news_app/models/article_model.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> future;

  @override
  void initState() {
    super.initState();
    future = NewsServices(Dio()).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'حدث خطأ أثناء تحميل الأخبار، حاول مرة أخرى لاحقًا.',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: const Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 89, 115, 128),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
