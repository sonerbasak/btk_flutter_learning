import 'package:isar/isar.dart';

part 'word.g.dart';

@collection
class Word {
  Id id = Isar.autoIncrement;
  late String englishWord;
  late String turkishWord;
  late String wordType;
  String? story;
  List<int>? imageBytes;
  bool isLearned = false;
  DateTime createdAt = DateTime.now();

  Word({
    required this.englishWord,
    required this.turkishWord,
    required this.wordType,
    this.story,
    this.imageBytes,
    this.isLearned = false,
  });

  @override
  String toString() {
    return 'Word{id: $id, englishWord: $englishWord, turkishWord: $turkishWord, wordType: $wordType, story: $story, isLearned: $isLearned, createdAt: $createdAt}';
  }
}
