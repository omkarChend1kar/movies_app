import 'package:flutter/material.dart';
import 'package:movies_app/src/features/home/view/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Main App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // initialRoute: HomePage.route,
      // routes: {
      //   HomePage.route: (context) => const HomePage(),
      //   // MoviesDetailsPage.route:(context) => const MoviesDetailsPage()
      // },
    );
  }
}
