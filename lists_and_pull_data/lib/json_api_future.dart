import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lists_and_pull_data/models/person_model.dart';

class JsonApiFuture extends StatelessWidget {
  const JsonApiFuture({super.key});

  Future<List<Person>> _loadJson() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      var jsonString = await rootBundle.loadString('assets/data/persons.json');

      Map<String, dynamic> jsonMap = json.decode(jsonString);
      // debugPrint(jsonMap["persons"][0]["sevdiği_renkler"].toString());
      List<dynamic> jsonList = jsonMap["persons"];

      List<Person> persons = jsonList
          .map((eleman) => Person.fromJson(eleman))
          .toList();
      for (var person in persons) {
        debugPrint(
          "${person.id} - ${person.isim} - ${person.sevdiiRenkler} - ${person.adres.il} - ${person.adres.sokak} - ${person.adres.no}",
        );
      }
      return persons;
    } catch (e) {
      debugPrint("Hata: ${e.toString()}");
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadJson();
    return FutureBuilder(
      future: _loadJson(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var myPersonList = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index) {
              var tekPerson = myPersonList[index];
              return Card(
                child: ListTile(
                  title: Text(tekPerson.isim),
                  leading: CircleAvatar(child: Text(tekPerson.id.toString())),
                  subtitle: Text(tekPerson.adres.toString()),
                ),
              );
            },
            itemCount: myPersonList.length,
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Hata: ${snapshot.error}"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
