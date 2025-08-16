import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:forecast_app/checkbox_switch_radio_slider.dart';
import 'package:forecast_app/model/wheather_model.dart';

void main(List<String> args) {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: CheckBoxSwitchRadioSlider(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> sehirler = [
    'Balıkesir',
    'Kayseri',
    'Ankara',
    'İstanbul',
    'İzmir',
    'Bursa',
    'Adana',
    'Antalya',
    'Konya',
    'Gaziantep',
  ];

  String? secilenSehir;
  Future<WeatherModel>? weatherFuture;

  void selectedCity(String sehir) {
    setState(() {
      secilenSehir = sehir;
      weatherFuture = getWeather(secilenSehir!);

      getWeather(secilenSehir!);
    });
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      queryParameters: {
        'appid': '574caf955201caf677f149f755101cb5',
        'lang': 'tr',
        'units': 'metric',
      },
    ),
  );

  Future<WeatherModel> getWeather(String secilenSehir) async {
    final response = await dio.get(
      'weather',
      queryParameters: {'q': secilenSehir},
    );
    var model = WeatherModel.fromJson(response.data);
    debugPrint(model.main?.temp.toString());
    return model;
  }

  Widget _builderWeatherCard(WeatherModel model) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              model.name!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            Text(
              "${model.main!.temp!.round()} °C",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              model.weather![0].description!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.water_drop_outlined),
                    SizedBox(height: 8),
                    Text("${model.main!.humidity!.round()} %"),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.air),
                    SizedBox(height: 8),
                    Text("${model.wind!.speed!.round()} %"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hava Durumu'), centerTitle: true),
      body: Column(
        children: [
          if (weatherFuture != null)
            FutureBuilder<WeatherModel>(
              future: weatherFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  final error = snapshot.error;
                  String errorMessage = 'Bilinmeyen bir hata oluştu.';

                  if (error is DioException) {
                    errorMessage = 'Hata: DioException\n';
                    if (error.error is SocketException) {
                      SocketException socketException =
                          error.error as SocketException;

                      // Hata detaylarını konsola yazdırma
                      debugPrint('--- SocketException Detayları ---');
                      debugPrint('Message: ${socketException.message}');
                      debugPrint(
                        'OS Error: ${socketException.osError?.message}',
                      );
                      debugPrint(
                        'OS Error Code: ${socketException.osError?.errorCode}',
                      );
                      debugPrint(
                        'Address: ${socketException.address?.address}',
                      );
                      debugPrint('Port: ${socketException.port}');
                      debugPrint('----------------------------------');

                      errorMessage +=
                          'Socket Hatası: ${socketException.message}\n';
                      // Hata kodunu ekranda göstermek
                      if (socketException.osError != null) {
                        errorMessage +=
                            'OS Hata Kodu: ${socketException.osError!.errorCode}\n';
                      }
                      errorMessage += 'İnternet bağlantınızı kontrol edin.';
                    } else {
                      errorMessage +=
                          'Dio Hata Tipi: ${error.type.toString()}\n';
                      errorMessage += 'Detay: ${error.message}';
                    }
                  } else {
                    errorMessage = 'Hata: ${error.toString()}';
                  }

                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return _builderWeatherCard(snapshot.data!);
                } else {
                  return const Center(child: Text('No data available'));
                }
              },
            ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                final isSelected = secilenSehir == sehirler[index];
                return GestureDetector(
                  onTap: () => selectedCity(sehirler[index]),
                  child: Card(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primaryContainer
                        : null,
                    child: Center(child: Text(sehirler[index])),
                  ),
                );
              },
              itemCount: sehirler.length,
            ),
          ),
        ],
      ),
    );
  }
}
