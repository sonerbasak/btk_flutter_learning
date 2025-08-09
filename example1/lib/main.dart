import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final url = 'https://compote.slate.com/images/1a5766f6-8b2c-4c04-adc9-e11ad39b137e.jpeg?crop=1560%2C1040%2Cx0%2Cy0&width=1200';

  Widget _buildItem(String value, String label) {
    return  Expanded(
      child: 
        Column(
          children: [
            Text(
              value, 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18
              )),
            Text(label)
          ],
        ),
    );  
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profil Sayfası'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(url),
                ),
                SizedBox(height: 10),
                Text(
                  "Soner Başak",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                   "Bilgisayar mühendisi",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24), 
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        _buildItem("1.5K", "Takipçi"),
                        _buildItem("2.5K", "Takipçi"),
                        _buildItem("150", "Gönderi")
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24), 
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hakkımda",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Flutter ile mobil uygulama geliştirme konusunda tutkulu bir bilgisayar mühendisi. Yeni teknolojileri takip ediyor ve sürekli öğrenmeye açığım."
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}