import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lists_and_pull_data/models/images_model.dart';

class DioKullanimi extends StatelessWidget {
  const DioKullanimi({super.key});

  Future<List<Photo>> _getPhotos() async {
    try {
      final dio = Dio();
      var url = "https://jsonplaceholder.typicode.com/photos";

      var response = await dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Photo> photoList = data
            .map((e) => Photo.fromJson(e))
            .toList();
        return photoList;
      } else {
        debugPrint("Hata: ${response.statusCode}");
        return [];
      }
    } on DioException catch (e) {
      debugPrint("Dio Hatası: ${e.message}");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPhotos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var photoList = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index) {
              var photo = photoList[index];
              debugPrint(photo.url);
              return ExpansionTile(
                leading: CircleAvatar(child: Text(photo.albumId.toString())),
                title: Text(photo.title),
                children: [Image.network(photo.url)],
              );
            },
            itemCount: photoList.length,
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
