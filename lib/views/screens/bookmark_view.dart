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
          return Stack(
            children: [
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://m.media-amazon.com/images/I/71K3sdQyfzL._AC_UF1000,1000_QL80_.jpg',
                          ),
                          fit: BoxFit.fill,
                          opacity: 0.5))),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: verseProvider.allBookmark.length,
                itemBuilder: (context, verseIndex) {
                  VerseModal verse = verseProvider.allBookmark[verseIndex];
                  return ListTile(
                    leading: Text(
                      '${verse.id}',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Bold',
                      ),
                    ),
                    title: Text(
                      '${verse.title}',
                      style: TextStyle(fontSize: 19.0),
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
                      Navigator.of(context).pushNamed('VerseEnglishDetail',
                          arguments: verseIndex);
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
