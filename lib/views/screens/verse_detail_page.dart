import 'package:auragita/controllers/verse_controllers.dart';
import 'package:auragita/modals/verse_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerseEnglishDetailPage extends StatelessWidget {
  const VerseEnglishDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    int VaIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Consumer<VerseController>(builder: (context, provider, _) {
      VerseModal verses = provider.AllVerse[VaIndex];
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Chapter ${verses.chapter_number}'),
          actions: [
            IconButton(
              icon: provider.isBookmark(verses)
                  ? Icon(Icons.bookmarks)
                  : Icon(Icons.bookmark_added),
              onPressed: () {
                if (provider.isBookmark(verses)) {
                  provider.removeFromBookmark(index: VaIndex);
                } else {
                  provider.addToBookmark(verse: verses);
                }
              },
            ),
          ],
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
                    '${verses.title}',
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
                  '${verses.transliteration}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '${verses.text}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Summary :- ',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '                  ${verses.word_meanings}',
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
                Center(
                  child: IconButton(
                    icon: provider.isFavorite(verses)
                        ? Icon(Icons.star, color: Colors.yellow)
                        : Icon(Icons.star_border),
                    onPressed: () {
                      if (provider.isFavorite(verses)) {
                        provider.removeFromFavorites(index: VaIndex);
                      } else {
                        provider.addToFavorites(verse: verses);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
