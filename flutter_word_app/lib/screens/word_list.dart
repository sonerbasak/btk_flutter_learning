import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_word_app/models/word.dart';
import 'package:flutter_word_app/services/isar_service.dart';

class WordList extends StatefulWidget {
  final IsarService isarService;
  const WordList({super.key, required this.isarService});

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  late Future<List<Word>> _getAllWords;
  List<Word> _kelimeler = [];
  List<Word> _filteredKelimeler = [];

  List<String> wordType = [
    'all',
    'noun',
    'verb',
    'adjective',
    'adverb',
    'phrasel verb',
    'idiom',
  ];
  String _selectedWordType = 'all';
  bool _hideLearned = false;

  @override
  void initState() {
    super.initState();
    _getAllWords = getWordsFromDb();
  }

  Future<List<Word>> getWordsFromDb() async {
    return await widget.isarService.getWords();
  }

  // ignore: unused_element
  void _refreshWords() {
    setState(() {
      _getAllWords = getWordsFromDb();
    });
  }

  void _toggleUpdateWord(Word word) async {
    await widget.isarService.toggleWordLearned(word.id);
    setState(() {
      final index = _kelimeler.indexWhere((w) => w.id == word.id);
      var degistirilecekKelime = _kelimeler[index];
      degistirilecekKelime.isLearned = !degistirilecekKelime.isLearned;
      _kelimeler[index] = degistirilecekKelime;
    });
  }

  void _deleteWord(Word word) async {
    await widget.isarService.deleteWord(word.id);
    setState(() {
      _kelimeler.removeWhere((w) => w.id == word.id);
    });
  }

  void _applyFilter() {
    _filteredKelimeler = List.from(_kelimeler);

    if (_selectedWordType != "all") {
      _filteredKelimeler = _filteredKelimeler
          .where((element) => element.wordType == _selectedWordType)
          .toList();
    }

    if (_hideLearned) {
      _filteredKelimeler = _filteredKelimeler
          .where((element) => element.isLearned != _hideLearned)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.filter_alt_off_rounded),
                      Text("Filtrele"),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 12.0,
                            left: 12.0,
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Kelime Türü',
                              border: OutlineInputBorder(),
                            ),
                            initialValue: _selectedWordType,
                            items: wordType
                                .map(
                                  (e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedWordType = value!;
                                _applyFilter();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Öğrendiklerimi gizle"),
                        Switch(
                          value: _hideLearned,
                          onChanged: (value) {
                            setState(() {
                              _hideLearned = !_hideLearned;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Word>>(
              future: _getAllWords,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  return snapshot.data!.isEmpty
                      ? Center(child: Text("Lütfen kelime ekleyin"))
                      : _buildListView(snapshot);
                } else {
                  return Center(child: Text("No words found"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildListView(AsyncSnapshot<List<Word>> snapshot) {
    _kelimeler = snapshot.data!.reversed.toList();
    _applyFilter();

    return ListView.builder(
      itemCount: _filteredKelimeler.length,
      itemBuilder: (context, index) {
        final word = _filteredKelimeler[index];
        return Card(
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 24),
              child: Icon(
                Icons.delete_outline_outlined,
                color: Theme.of(context).colorScheme.error,
                size: 32,
              ),
            ),
            onDismissed: (direction) => _deleteWord(word),
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Delete Word"),
                    content: Text(
                      "Are you sure you want to delete ${word.englishWord}?",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Delete"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(word.englishWord),
                    subtitle: Text(word.turkishWord),
                    leading: Chip(label: Text(word.wordType)),
                    trailing: Switch(
                      value: word.isLearned,
                      onChanged: (value) => _toggleUpdateWord(word),
                    ),
                  ),
                  if (word.story != null && word.story!.isNotEmpty)
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                          // ignore: deprecated_member_use
                        ).colorScheme.secondaryContainer.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.lightbulb_outline),
                              SizedBox(width: 4),
                              Text("Hatırlatıcı Not"),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              word.story ?? "",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (word.imageBytes != null)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.memory(
                        Uint8List.fromList(word.imageBytes!),
                        height: 120,
                        width: double.infinity,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
