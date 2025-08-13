// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Person> persons;

  Welcome({required this.persons});

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    persons: List<Person>.from(json["persons"].map((x) => Person.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "persons": List<dynamic>.from(persons.map((x) => x.toJson())),
  };
}

class Person {
  int id;
  String isim;
  List<String> sevdiiRenkler;
  Adres adres;

  Person({
    required this.id,
    required this.isim,
    required this.sevdiiRenkler,
    required this.adres,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    isim: json["isim"],
    sevdiiRenkler: List<String>.from(json["sevdiği_renkler"].map((x) => x)),
    adres: Adres.fromJson(json["adres"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isim": isim,
    "sevdiği_renkler": List<dynamic>.from(sevdiiRenkler.map((x) => x)),
    "adres": adres.toJson(),
  };
}

class Adres {
  String sokak;
  String no;
  String ile;
  String il;

  @override
  String toString() {
    // TODO: implement toString
    return "$sokak $no, $ile, $il";
  }

  Adres({
    required this.sokak,
    required this.no,
    required this.ile,
    required this.il,
  });

  factory Adres.fromJson(Map<String, dynamic> json) => Adres(
    sokak: json["sokak"],
    no: json["no"],
    ile: json["ilçe"],
    il: json["il"],
  );

  Map<String, dynamic> toJson() => {
    "sokak": sokak,
    "no": no,
    "ilçe": ile,
    "il": il,
  };
}
