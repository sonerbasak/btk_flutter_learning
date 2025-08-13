import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lists_and_pull_data/tek_satirlik_widget.dart';

class ListViewKullanimi extends StatefulWidget {
  const ListViewKullanimi({super.key});

  @override
  State<ListViewKullanimi> createState() => _ListViewKullanimiState();
}

class _ListViewKullanimiState extends State<ListViewKullanimi> {
  List<Ogrenci> ogrenciler = List.generate(
    1000,
    (index) => Ogrenci(
      id: index,
      isim: 'Öğrenci ${index + 1}',
      erkekMi: index % 2 == 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ogrenciler.length,
      itemBuilder: (context, index) => GestureDetector(
        onLongPress: () {
          debugPrint("Gesture'a Tıklandı: ${ogrenciler[index].isim}");
        },
        child: Card(
          color: ogrenciler[index].erkekMi
              ? Colors.blue.shade200
              : Colors.pink.shade100,
          child: ListTile(
            onTap: () {
              SmartDialog.show(
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Listtile'a Tıklandı: ${ogrenciler[index].isim}",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              );
              debugPrint("Listtile'a Tıklandı: ${ogrenciler[index].isim}");
            },
            title: Text(ogrenciler[index].isim),
            leading: CircleAvatar(child: Text(ogrenciler[index].id.toString())),
          ),
        ),
      ),
    );

    //Tek satırlık widget'ı kullanmak için aşağıdaki satırı açabilirsin.
    //return SingleChildScrollView(child: tekSatirlikListtile());
  }

  // ignore: non_constant_identifier_names
  ListView ListViewKullanimi() {
    return ListView(
      children: [
        tekSatirlikListtile(),
        tekSatirlikListtile(),
        tekSatirlikListtile(),
        tekSatirlikListtile(),
        tekSatirlikListtile(),
        tekSatirlikListtile(),
      ],
    );
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final bool erkekMi;

  Ogrenci({required this.id, required this.isim, required this.erkekMi});

  @override
  String toString() {
    return isim;
  }
}
