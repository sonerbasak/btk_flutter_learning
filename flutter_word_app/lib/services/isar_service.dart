import 'package:flutter/material.dart';
import 'package:flutter_word_app/models/word.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Isar isar;

  Future<void> init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open([WordSchema], directory: dir.path);
    } catch (e) {
      debugPrint("Error initializing Isar: $e");
    }
  }

  Future<void> saveWord(Word word) async {
    try {
      await isar.writeTxn(() async {
        await isar.words.put(word);
      });
    } catch (e) {
      debugPrint("Error saving word: $e");
    }
  }

  Future<List<Word>> getWords() async {
    try {
      final words = isar.words.where().findAll();
      return words;
    } catch (e) {
      debugPrint("Error fetching words: $e");
      return [];
    }
  }

  Future<void> deleteWord(int id) async {
    try {
      await isar.writeTxn(() async {
        await isar.words.delete(id);
        debugPrint("Deleting word: $id");
      });
    } catch (e) {
      debugPrint("Error deleting word: $e");
    }
  }

  Future<void> updateWord(Word word) async {
    try {
      await isar.writeTxn(() async {
        await isar.words.put(word);
      });
    } catch (e) {
      debugPrint("Error updated word: $e");
    }
  }

  Future<void> toggleWordLearned(int id) async {
    try {
      await isar.writeTxn(() async {
        final word = await isar.words.get(id);
        if (word != null) {
          word.isLearned = !word.isLearned;
          await isar.words.put(word);
        } else {
          debugPrint("Word with ID $id not found.");
        }
      });
    } catch (e) {
      debugPrint("Error toggling word learned status: $e");
    }
  }
}
