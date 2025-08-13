import 'package:flutter/material.dart';

// ignore: camel_case_types
class tekSatirlikListtile extends StatelessWidget {
  const tekSatirlikListtile({super.key});

  @override
  Widget build(BuildContext context) {
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
