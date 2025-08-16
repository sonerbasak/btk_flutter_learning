import 'package:flutter/material.dart';

class Veriktarimi extends StatelessWidget {
  Veriktarimi({super.key});

  List<Ogrenci> ogrenciler = List.generate(
    100,
    (index) => Ogrenci(
      isim: "Öğrenci $index",
      yas: 10 + index % 10,
      sehir: "Şehir ${index % 5}",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Veri Aktarımı'), centerTitle: true),

      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OgrenciDetay(ogrenci: ogrenciler[index]),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(ogrenciler[index].isim),
                subtitle: Text("Şehir: ${ogrenciler[index].sehir}"),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: CircleAvatar(
                  child: Text(ogrenciler[index].yas.toString()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Ogrenci {
  final String isim;
  final int yas;
  final String sehir;

  Ogrenci({required this.isim, required this.yas, required this.sehir});
}

class OgrenciDetay extends StatelessWidget {
  final Ogrenci ogrenci;
  const OgrenciDetay({super.key, required this.ogrenci});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Öğrenci Detay Sayfası")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ogrenci.isim),
            Text(ogrenci.sehir),
            Text(ogrenci.yas.toString()),
          ],
        ),
      ),
    );
  }

  Center tekDetayOgrenci() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(ogrenci.isim)],
      ),
    );
  }
}
