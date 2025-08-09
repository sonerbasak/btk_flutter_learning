import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple, 
        useMaterial3: false),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _sayac = 0;

  void _sayaciArttir() {
    setState(() {
      _sayac++;
      debugPrint("Sayac: $_sayac");      
    });
  }

  void _sayaciAzalt() {
    setState(() {
      if (_sayac > 0) {
        _sayac--;
        debugPrint("Sayac: $_sayac");
      }      
    });
  }
  void _sayaciSifirla() {
    setState(() {
      if (_sayac != 0) {
        _sayac = 0;
        debugPrint("Sayac: $_sayac");
      }      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bölüm 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Butona basılma miktarı:", style: Theme.of(context).textTheme.labelLarge),
            Text(_sayac.toString(), style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: _sayac <= 0 ? Colors.red : Colors.green,
            )),
          ]
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () {
            _sayaciArttir();
          }, 
          child: Icon(Icons.add)),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
            _sayaciAzalt();
          }, 
          child: Icon(Icons.remove)),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
            _sayaciSifirla();
          }, 
          child: Icon(Icons.refresh)),
        ],
      ),
    );
  }
}
