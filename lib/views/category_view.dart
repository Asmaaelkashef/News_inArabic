import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_list_view.dart';

class CategoryNewsView extends StatelessWidget {
  final String category;

  const CategoryNewsView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFF5F5F5), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
        title: Text(
          'أخبار $category',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<ArticleModel>>(
          future: NewsServices(Dio()).getNews(category: category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text(
                'حدث خطأ أثناء تحميل الأخبار',
                style: TextStyle(fontSize: 18),
              ));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text(
                'لا توجد أخبار حاليًا',
                style: TextStyle(fontSize: 18),
              ));
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  NewsListView(articles: snapshot.data!),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
