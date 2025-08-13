import 'package:flutter/material.dart';

class ButonTurleri extends StatelessWidget {
  const ButonTurleri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buton Türleri")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the FAB
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red),
              ),
              child: Text("Text Button"),
            ),
            TextButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.amber;
                  }
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.blueGrey;
                  }
                  return null;
                }),
              ),
              label: Text("Text Button Icon"),
              icon: Icon(Icons.add),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text("Elevated Button"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text("Elevated Button"),
              icon: Icon(Icons.remove),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(16),
                shape: StadiumBorder(),
                side: BorderSide(color: Colors.purple, width: 4),
                // ignore: deprecated_member_use
                backgroundColor: Colors.pink.withOpacity(0.7),
                foregroundColor: Colors.white,
              ),
              child: Text("Outlined Button"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: BorderSide(color: Colors.red),
              ),
              label: Text("Outlined Button w Icon"),
              icon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
