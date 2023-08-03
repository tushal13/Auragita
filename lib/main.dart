import 'package:auragita/controllers/chapter_controllers.dart';
import 'package:auragita/controllers/verse_controllers.dart';
import 'package:auragita/views/screens/Splesh_screen.dart';
import 'package:auragita/views/screens/chapter_detail_page.dart';
import 'package:auragita/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/screens/verse_detail_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChapterController(),
        ),
        ChangeNotifierProvider(
          create: (context) => VerseController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.amber,
          brightness: Brightness.light,
          fontFamily: 'Medium'),
      title: 'AuraGita',
      routes: {
        '/': (context) => const SPLASH_SCREEN(),
        'home': (context) => const HomePage(),
        'ChapterEnglishDetail': (context) => const ChapterEnglishDetailPage(),
        'VerseEnglishDetail': (context) => const VerseEnglishDetailPage(),
        // 'SongPlayer': (context) => SongPlayerPage(),
      },
    );
  }
}
