import 'package:auragita/views/screens/Verse_view.dart';
import 'package:auragita/views/screens/bookmark_view.dart';
import 'package:auragita/views/screens/chapter_view.dart';
import 'package:auragita/views/screens/favorite_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: 2,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          SliverAppBar(
            title: const Text("Auragita"),
            bottom: TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  text: "Chapter",
                ),
                Tab(
                  text: "Verse's",
                ),
                Tab(
                  text: "Favorite",
                ),
                Tab(
                  text: "Bookmark",
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: tabController,
          children: [
            ChapterView(),
            VerseView(),
            FavoritePage(),
            BookmarkPage(),
          ],
        ),
      ),
    );
  }
}
