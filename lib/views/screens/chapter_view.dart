import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auragita/controllers/chapter_controllers.dart';
import 'package:auragita/modals/chapter_modal.dart';

class ChapterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChapterController>(
      builder: (context, chapterProvider, _) {
        List<ChapterModal> allChapter = chapterProvider.AllChapter;
        return Scaffold(
          body: ListView.builder(
            itemCount: allChapter.length,
            itemBuilder: (context, index) {
              ChapterModal chapter = allChapter[index];
              return Column(
                children: [
                  Divider(),
                  ListTile(
                    leading: Text('${chapter.chapter_number}'),
                    title: Text('${chapter.name_translation}'),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('ChapterEnglishDetail', arguments: index);
                    },
                  ),
                  Divider(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
