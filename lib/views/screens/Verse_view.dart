import 'package:auragita/controllers/verse_controllers.dart';
import 'package:auragita/modals/verse_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VerseController>(
      builder: (context, pro, _) {
        return Scaffold(
          body: ListView.builder(
            itemCount: pro.AllVerse.length,
            itemBuilder: (context, index) {
              VerseModal Verse = pro.AllVerse[index];
              return Column(
                children: [
                  Divider(),
                  ListTile(
                    leading: Text('${Verse.id}'),
                    title: Text('${Verse.title}'),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('VerseEnglishDetail', arguments: index);
                    },
                    trailing: IconButton(
                      icon: pro.isFavorite(Verse)
                          ? Icon(Icons.star, color: Colors.yellow)
                          : Icon(Icons.star_border),
                      onPressed: () {
                        if (pro.isFavorite(Verse)) {
                          pro.removeFromFavorites(index: index);
                        } else {
                          pro.addToFavorites(verse: Verse);
                        }
                      },
                    ),
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
