import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_list_view.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "بالعربي"  ,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 134, 235),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  " News",
                  style: TextStyle(
                    letterSpacing: 1.7,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = const Color.fromARGB(255, 226, 231, 230),
                  ),
                ),
                const Text(
                  " News",
                  style: TextStyle(
                    letterSpacing: 1.7,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 108, 123, 131),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CategoriesListView(),
                  const SizedBox(height: 20), 
                ],
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            sliver: NewsListViewBuilder(),
          ),
        ],
      ),
    );
  }
}
