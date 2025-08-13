import 'package:flutter/material.dart';

class DropdownPopup extends StatelessWidget {
  const DropdownPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown & Pop-up"),
        actions: [PopupMenuKullanimi()],
      ),
      body: Center(child: Column(children: [DropdownButtonKullanimi()])),
    );
  }
}

class DropdownButtonKullanimi extends StatefulWidget {
  const DropdownButtonKullanimi({super.key});

  @override
  State<DropdownButtonKullanimi> createState() =>
      _DropdownButtonKullanimiState();
}

class _DropdownButtonKullanimiState extends State<DropdownButtonKullanimi> {
  // ignore:  strict_top_level_inference, prefer_typing_uninitialized_variables
  var _secilenSehir;
  final _sehirler = ["Ankara", "İzmir", "Balıkesir", "Bursa"];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("Şehir Seçin"),
      value: _secilenSehir,
      items: _sehirler
          .map(
            (String sehir) =>
                DropdownMenuItem(value: sehir, child: Text(sehir)),
          )
          .toList(),

      // [
      // DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
      // DropdownMenuItem(value: "İstanbul", child: Text("İstanbul")),
      // DropdownMenuItem(value: "İzmir", child: Text("İzmir")),
      // DropdownMenuItem(value: "Balıkesir", child: Text("Balıkesir")),
      // ],
      onChanged: (value) {
        debugPrint("Seçilen şehir $value");
        setState(() {
          _secilenSehir = value!;
        });
      },
    );
  }
}

class PopupMenuKullanimi extends StatefulWidget {
  const PopupMenuKullanimi({super.key});

  @override
  State<PopupMenuKullanimi> createState() => _PopupMenuKullanimiState();
}

class _PopupMenuKullanimiState extends State<PopupMenuKullanimi> {
  // ignore:  strict_top_level_inference, prefer_typing_uninitialized_variables
  var _secilenSehir = "Ankara";
  final _sehirler = ["Ankara", "İzmir", "Balıkesir", "Bursa"];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue: _secilenSehir,
      // icon: Icon(Icons.add),
      // child: Text(_secilenSehir),
      itemBuilder: (context) {
        return _sehirler.map((String sehir) {
          return PopupMenuItem(value: sehir, child: Text(sehir));
        }).toList();
      },
      onSelected: (value) {
        setState(() {});
        _secilenSehir = value;
      },
    );
  }
}
