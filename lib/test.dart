// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   Future<void> _launchUrl() async {
//     final Uri url = Uri.parse('https://flutter.dev');
//     if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
//       print('Could not launch $url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('URL Launcher Test')),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: _launchUrl,
//             child: const Text('Open flutter.dev'),
//           ),
//         ),
//       ),
//     );
//   }
// }
