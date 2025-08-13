import 'package:flutter/material.dart';
import 'package:lists_and_pull_data/list_view_kullanimi.dart';

class GridviewCesitleri extends StatelessWidget {
  const GridviewCesitleri({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Ogrenci> ogrenciler = List.generate(
      1000,
      (index) => Ogrenci(
        id: index,
        isim: 'Öğrenci ${index + 1}',
        erkekMi: index % 2 == 0,
      ),
    );

    return GridView.builder(
      itemCount: ogrenciler.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
        childAspectRatio: MediaQuery.of(context).size.width > 600 ? 1.5 : 1,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[100 * ((index + 1) % 10)],
          child: Text(
            ogrenciler[index].toString(),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  GridView gridviewextent() {
    return GridView.extent(
      primary: false,
      maxCrossAxisExtent: 95,
      padding: EdgeInsets.all(8),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      reverse: false,
      scrollDirection: Axis.vertical,
      children: createContainers(20),
    );
  }

  GridView gridviewcount() {
    return GridView.count(
      primary: false,
      crossAxisCount: 3,
      padding: EdgeInsets.all(8),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      reverse: true,
      scrollDirection: Axis.horizontal,
      children: createContainers(20),
    );
  }
}

List<Widget> createContainers(int length) {
  return List.generate(length, (index) {
    var renkShade = 100 * ((index + 1) % 10);
    var sonShade = renkShade == 0 ? 50 : renkShade;
    return Container(
      alignment: Alignment.center,
      color: Colors.green[sonShade],

      child: Text("Container $sonShade", textAlign: TextAlign.center),
    );
  });
}
