import 'package:auragita/controllers/chapter_controllers.dart';
import 'package:auragita/modals/chapter_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterEnglishDetailPage extends StatelessWidget {
  const ChapterEnglishDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    int chIndex = ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<ChapterController>(builder: (context, provider, _) {
      ChapterModal chepter = provider.AllChapter[chIndex];
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ChapterNumber : ${chepter.chapter_number}'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    '${chepter.name_translation}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  '         ${chepter.chapter_summary}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    '${chepter.name}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  '         ${chepter.chapter_summary_hindi}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    '...',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Congratulations! You have Completed Today's Reading📖📖.",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
