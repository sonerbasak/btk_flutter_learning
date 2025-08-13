import 'package:flutter/material.dart';

class CardListtileKullanimi extends StatefulWidget {
  const CardListtileKullanimi({super.key});

  @override
  State<CardListtileKullanimi> createState() => _CardListtileKullanimiState();
}

class _CardListtileKullanimiState extends State<CardListtileKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            tekSatir(),
            tekSatir(),
            tekSatir(),
            tekSatir(),
            tekSatir(),
            tekSatir(),
            tekSatir(),
            tekSatir(),
            tekSatir(),
            tekSatir(),
          ],
        ),
      ),
    );
  }

  Column tekSatir() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          leading: const CircleAvatar(child: Icon(Icons.add)),
          trailing: const Icon(Icons.arrow_forward_ios),
          title: const Text('Soner Başak'),
          subtitle: const Text('Flutter Developer'),
        ),
        Divider(
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}
