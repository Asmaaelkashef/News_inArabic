import 'package:flutter/material.dart';
import 'package:news_app/views/category_view.dart'; // تأكدي إنك عندك الملف ده

class Cards extends StatelessWidget {
  final String image;
  final String text;

  const Cards({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CategoryNewsView(category: text),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 30,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..color = const Color.fromARGB(255, 108, 123, 131),
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
