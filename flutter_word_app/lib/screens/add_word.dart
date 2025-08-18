import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_word_app/models/word.dart';
import 'package:flutter_word_app/services/isar_service.dart';
import 'package:image_picker/image_picker.dart';

class AddWord extends StatefulWidget {
  final IsarService isarService;
  final VoidCallback onSave;
  const AddWord({super.key, required this.isarService, required this.onSave});

  @override
  State<AddWord> createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  final _formKey = GlobalKey<FormState>();
  final _englishWordController = TextEditingController();
  final _turkishWordController = TextEditingController();
  final _storyController = TextEditingController();
  String _selectedWordType = 'noun';
  bool _isLearned = false;
  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;

  @override
  void dispose() {
    _englishWordController.dispose();
    _turkishWordController.dispose();
    _storyController.dispose();
    super.dispose();
  }

  void _resimSec() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null && image.path.isNotEmpty) {
      setState(() {
        _imageFile = File(image.path);
      });
      debugPrint("Selected image path: ${image.path}");
    } else {
      debugPrint("No image selected.");
    }
  }

  Future<void> _saveWords() async {
    if (_formKey.currentState!.validate()) {
      var englishWord = _englishWordController.text;
      var turkishWord = _turkishWordController.text;
      var story = _storyController.text;
      debugPrint(
        "Saving word: $englishWord, $turkishWord, $_selectedWordType, $story, Learned: $_isLearned",
      );
      await widget.isarService.saveWord(
        Word(
          englishWord: englishWord,
          turkishWord: turkishWord,
          wordType: _selectedWordType,
          story: story,
          isLearned: _isLearned,
          imageBytes: _imageFile != null
              ? await _imageFile!.readAsBytes()
              : null, // Save the image path if available
        ),
      );
      widget.onSave();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an English word';
                }
                return null;
              },
              controller: _englishWordController,
              decoration: InputDecoration(
                labelText: 'English Word',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Turkish word';
                }
                return null;
              },
              controller: _turkishWordController,
              decoration: InputDecoration(
                labelText: 'Turkish Word',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedWordType,
              items:
                  [
                        'noun',
                        'verb',
                        'adjective',
                        'adverb',
                        'phrasel verb',
                        'idiom',
                      ]
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedWordType = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Word Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: 'Word Story',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Learned:'),
                Switch(
                  value: _isLearned,
                  onChanged: (value) {
                    setState(() {
                      _isLearned = !_isLearned;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: _resimSec,
              label: Text('Select Image'),
              icon: Icon(Icons.image),
            ),
            SizedBox(height: 8),
            if (_imageFile != null)
              Image.file(_imageFile!, height: 150, fit: BoxFit.cover),
            SizedBox(height: 8),
            ElevatedButton(onPressed: _saveWords, child: Text("Kaydet")),
          ],
        ),
      ),
    );
  }
}
