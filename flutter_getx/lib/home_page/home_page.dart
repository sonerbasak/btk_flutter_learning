import 'package:flutter/material.dart';
import 'package:flutter_getx/home_page/sayac_controller.dart';
import 'package:flutter_getx/home_page/sayi_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Getx Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            GetBuilder<SayacController>(
              builder: (controller) => Text(
                controller.sayac.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Obx(
              () =>
                  Text(Get.find<SayiController>().randomSayi.value.toString()),
            ),
            Obx(() {
              var c = Get.find<SayiController>();
              return Text(c.randomSayi.value.toString());
            }),
            GetX<SayiController>(
              builder: (controller) =>
                  Text(controller.randomSayi.value.toString()),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyFloatingActionButton(),
          SizedBox(height: 10),
          RastgeleSayiUret(),
        ],
      ),
    );
  }
}

class RastgeleSayiUret extends GetView<SayiController> {
  const RastgeleSayiUret({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //Get.find<SayiController>().uret();
        controller.uret();
      },
      child: Icon(Icons.refresh),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    SayacController controller = Get.find();
    var controller2 = Get.find<SayacController>();

    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            controller.arttir();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () {
            controller.azalt();
          },
          tooltip: 'Decrement',
          child: Text("---"),
        ),
      ],
    );
  }
}
