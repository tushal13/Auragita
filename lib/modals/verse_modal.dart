class VerseModal {
  final int chapter_id;
  final int chapter_number;
  final int externalId;
  final int id;
  final String text;
  final String title;
  final String transliteration;
  final String word_meanings;
  bool isExpanded;
  bool isFavorite;
  bool isBookmark;

  VerseModal({
    required this.chapter_id,
    required this.chapter_number,
    required this.externalId,
    required this.id,
    required this.text,
    required this.title,
    required this.transliteration,
    required this.word_meanings,
    this.isExpanded = false,
    this.isFavorite = false,
    this.isBookmark = false,
  });

  factory VerseModal.fromMap({required Map<String, dynamic> data}) {
    return VerseModal(
      chapter_id: data['chapter_id'],
      chapter_number: data['chapter_number'],
      externalId: data['externalId'],
      id: data['id'],
      text: data['text'],
      title: data['title'],
      transliteration: data['transliteration'],
      word_meanings: data['word_meanings'],
    );
  }
}
