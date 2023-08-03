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
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://w0.peakpx.com/wallpaper/868/432/HD-wallpaper-bhagavad-gita-graphics-design-indian-mythology-spiritual.jpg',
                        ),
                        fit: BoxFit.fill,
                        opacity: 0.5)),
              ),
              ListView.builder(
                itemCount: allChapter.length,
                itemBuilder: (context, index) {
                  ChapterModal chapter = allChapter[index];
                  return Column(
                    children: [
                      Divider(),
                      ListTile(
                        leading: Text(
                          '${chapter.chapter_number}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                        ),
                        title: Text('${chapter.name_translation}'),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              'ChapterEnglishDetail',
                              arguments: index);
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
