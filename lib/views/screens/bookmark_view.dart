import 'package:auragita/controllers/verse_controllers.dart';
import 'package:auragita/modals/verse_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<VerseController>(
        builder: (context, verseProvider, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: verseProvider.allBookmark.length,
              itemBuilder: (context, verseIndex) {
                VerseModal verse = verseProvider.allBookmark[verseIndex];
                return ListTile(
                  leading: Text('${verse.id}'),
                  title: Text(
                    '${verse.title}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  trailing: IconButton(
                    icon: verseProvider.isBookmark(verse)
                        ? Icon(Icons.bookmark_remove)
                        : Icon(Icons.bookmark_added_outlined),
                    onPressed: () {
                      if (verseProvider.isBookmark(verse)) {
                        verseProvider.removeFromBookmark(index: verseIndex);
                      } else {
                        verseProvider.addToBookmark(verse: verse);
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('VerseEnglishDetail', arguments: verseIndex);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
