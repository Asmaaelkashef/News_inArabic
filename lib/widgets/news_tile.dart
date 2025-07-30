import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () async {
            print('Opening URL: ${articleModel.url}');
            await _launchUrl(articleModel.url);
          },

          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.network(
              articleModel.image ?? '',
              height: 177,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 190,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 177,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.broken_image_outlined,
                      size: 50,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 9),
        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xFF222222),
            fontSize: 17,
            fontWeight: FontWeight.bold,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          articleModel.subtitle ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 13,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
