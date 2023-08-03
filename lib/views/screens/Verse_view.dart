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
          body: Stack(
            children: [
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://rukminim2.flixcart.com/image/850/1000/kingqkw0-0/book/n/g/q/the-bhagavad-gita-original-imafyed7a6nyc6ea.jpeg',
                          ),
                          fit: BoxFit.fill,
                          opacity: 0.5))),
              ListView.builder(
                itemCount: pro.AllVerse.length,
                itemBuilder: (context, index) {
                  VerseModal Verse = pro.AllVerse[index];
                  return Column(
                    children: [
                      Divider(),
                      ListTile(
                        leading: Text(
                          'Ch:${Verse.chapter_number}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                        ),
                        title: Text(
                          '${Verse.title}',
                          style: TextStyle(fontSize: 19),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('VerseEnglishDetail',
                              arguments: index);
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
            ],
          ),
        );
      },
    );
  }
}
