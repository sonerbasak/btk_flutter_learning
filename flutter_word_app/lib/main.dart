import 'package:flutter/material.dart';
import 'package:flutter_word_app/screens/add_word.dart';
import 'package:flutter_word_app/screens/word_list.dart';
import 'package:flutter_word_app/services/isar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isarService = IsarService();

  try {
    await isarService.init();

    try {
      await isarService.getWords();
      debugPrint("Words fetched successfully.");
      debugPrint("Words: ${await isarService.getWords()}");
    } catch (e) {
      debugPrint("Error fetching words: $e");
    }
  } catch (e) {
    debugPrint("Error in main: $e");
  }
  runApp(MyApp(isarService: isarService));
}

class MyApp extends StatelessWidget {
  final IsarService isarService;
  const MyApp({super.key, required this.isarService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(isarService: isarService),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final IsarService isarService;
  const MyHomePage({super.key, required this.isarService});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> getScreens() {
    return [
      WordList(isarService: widget.isarService),
      AddWord(
        isarService: widget.isarService,
        onSave: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Word saved successfully!")));
          setState(() {
            _selectedScreen = 0;
          });
        },
      ),
    ];
  }

  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kelimelerim")),
      body: getScreens()[_selectedScreen],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedScreen,
        destinations: [
          NavigationDestination(icon: Icon(Icons.list), label: "Kelimelerim"),
          NavigationDestination(icon: Icon(Icons.add), label: "Kelime Ekle"),
        ],
        onDestinationSelected: (value) {
          setState(() {
            _selectedScreen = value;
          });
        },
      ),
    );
  }
}
