import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final article = articles[index];

        return GestureDetector(
          onTap: () => _launchUrl(article.url),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.network(
                    article.image!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, size: 40),
                    ),
                  ),
                )
              else
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 40),
                ),
              const SizedBox(height: 8),
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 0.2),
              if (article.subtitle != null && article.subtitle!.isNotEmpty)
                Text(
                  article.subtitle!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  textDirection: TextDirection.rtl,
                ),
              const SizedBox(height: 12),
            ],
          ),
        );
      }, childCount: articles.length),
    );
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Can't launch $url");
    }
  }
}
