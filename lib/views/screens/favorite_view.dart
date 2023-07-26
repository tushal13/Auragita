import 'package:auragita/controllers/verse_controllers.dart';
import 'package:auragita/modals/verse_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
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
              itemCount: verseProvider.allFavorite.length,
              itemBuilder: (context, verseIndex) {
                VerseModal verse = verseProvider.allFavorite[verseIndex];
                return ListTile(
                  leading: Text('${verse.id}'),
                  title: Text(
                    '${verse.title}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  trailing: IconButton(
                    icon: verseProvider.isFavorite(verse)
                        ? Icon(Icons.star, color: Colors.yellow)
                        : Icon(Icons.star_border),
                    onPressed: () {
                      if (verseProvider.isFavorite(verse)) {
                        verseProvider.removeFromFavorites(index: verseIndex);
                      } else {
                        verseProvider.addToFavorites(verse: verse);
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
