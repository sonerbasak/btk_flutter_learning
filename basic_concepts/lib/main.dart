import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(TestApp());
}

class TestApp extends StatelessWidget{
  const TestApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    var pinkContainer = Container(
          color: Colors.pink,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myContainer(),
              myContainer(),
            ],
          ),
        );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Test App"),
        ),
        body: Row(
          children: [
            Flexible(
              flex:1,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.blue,
                width: 300,
                height: 300,
              ),
            ),
            Flexible(
              flex:3,
              child: Container(
                color: Colors.orange,
                width: 50,
                height: 300,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { 
          debugPrint("Butona Tıklandı");
          },
          backgroundColor: Colors.cyan,
          child: Icon(Icons.add_alert),
         ),
      ),
    );
  }

  List<Widget> get expandedPractice {
    return [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              width: 150,
              height: 150,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
              width: 150,
              height: 150,
            ),
          ),            
          Expanded(
            flex:1,
            child: Container(
              color: Colors.pink,
              width: 150,
              height: 150,
            ),
          ),
        ];
  }

  Column myMainColumn(Container pinkContainer) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          pinkContainer,
          pinkContainer,
        ],
      );
  }

  Container myContainer() {
    return Container(
        color: Colors.amber,
        height: 150,
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: Text("Hello, World"),
          ),
        );
  }

}