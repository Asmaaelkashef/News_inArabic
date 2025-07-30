import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

final dio = Dio();


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
