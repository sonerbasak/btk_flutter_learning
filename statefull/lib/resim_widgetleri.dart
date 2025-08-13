import 'package:flutter/material.dart';

class ResimWidgetleri extends StatelessWidget {
  const ResimWidgetleri({super.key});

  final _url =
      "http://bilisimtoplulugu.mcbu.edu.tr/media/images/yonetim/WhatsApp_Image_2024-10-03_at_23.59.02_2_1.jpeg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resim Widgetları")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.blue.shade300,
                    child: Image.asset(
                      "assets/images/cat.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.blue.shade300,
                    child: Image.network(_url, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: 'assets/images/cat.jpeg',
                image: _url,
              ),
            ),
            Expanded(child: Placeholder(color: Colors.amber)),
            Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/cat.jpeg"),
                    radius: 80,
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_url),
                    radius: 80,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
