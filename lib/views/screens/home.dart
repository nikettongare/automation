import 'package:automation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (homeController) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () async {
                          await homeController.updateData(fieldName: "Bulb");
                        },
                        color: homeController.bulbColor,
                        height: _width * 0.3,
                        minWidth: _width * 0.3,
                        child: const Text(
                          "Bulb",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          await homeController.updateData(
                              fieldName: "TubeLight");
                        },
                        color: homeController.tubeLightColor,
                        height: _width * 0.3,
                        minWidth: _width * 0.3,
                        child: const Text(
                          "TubeLight",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () async {
                          await homeController.updateData(fieldName: "Fan");
                        },
                        color: homeController.fanColor,
                        height: _width * 0.3,
                        minWidth: _width * 0.3,
                        child: const Text(
                          "Fan",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          await homeController.updateData(fieldName: "Input");
                        },
                        color: homeController.inputColor,
                        height: _width * 0.3,
                        minWidth: _width * 0.3,
                        child: const Text(
                          "Input",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () async {
                      await homeController.syncData();
                    },
                    color: Colors.black,
                    height: 45,
                    minWidth: 150,
                    child: const Text(
                      "Synk",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }),
      )),
    );
  }
}
