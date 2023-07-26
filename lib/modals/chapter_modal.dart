class ChapterModal {
  final int chapter_number;
  final String chapter_summary;
  final String chapter_summary_hindi;
  final int id;
  final String image_name;
  final String name;
  final String name_meaning;
  final String name_translation;
  final String name_transliterated;
  final int verses_count;
  bool isExpanded;

  ChapterModal({
    required this.chapter_number,
    required this.chapter_summary,
    required this.chapter_summary_hindi,
    required this.id,
    required this.image_name,
    required this.name,
    required this.name_meaning,
    required this.name_translation,
    required this.name_transliterated,
    required this.verses_count,
    this.isExpanded = false,
  });

  factory ChapterModal.fromMap({required Map<String, dynamic> data}) {
    return ChapterModal(
      chapter_number: data['chapter_number'],
      chapter_summary: data['chapter_summary'],
      chapter_summary_hindi: data['chapter_summary_hindi'],
      id: data['id'],
      image_name: data['image_name'],
      name: data['name'],
      name_meaning: data['name_meaning'],
      name_translation: data['name_translation'],
      name_transliterated: data['name_transliterated'],
      verses_count: data['verses_count'],
    );
  }
}
