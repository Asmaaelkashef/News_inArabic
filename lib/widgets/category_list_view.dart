import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Cards(image: 'assets/images/health.jpg', text: 'الصحة'),
          SizedBox(width: 9),
          Cards(image: 'assets/images/sport.jpg', text: 'الرياضة'),
          SizedBox(width: 9),
          Cards(image: 'assets/images/technology.jpg', text: 'التكنولوجيا'),
          SizedBox(width: 9),
          Cards(image: 'assets/images/entertainment.jpg', text: 'الفن'),
          SizedBox(width: 9),
        ],
      ),
    );
  }
}
