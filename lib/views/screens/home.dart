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
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            centerTitle: true,
            title: const Text(
              "Automation",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
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
                              await homeController.updateData(
                                  fieldName: "BULB_STATUS");
                            },
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_width * 0.2)),
                            color: homeController.bulbColor,
                            height: _width * 0.3,
                            minWidth: _width * 0.3,
                            child: const Text(
                              "BULB",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              await homeController.updateData(
                                  fieldName: "LIGHT_STATUS");
                            },
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_width * 0.2)),
                            color: homeController.lightColor,
                            height: _width * 0.3,
                            minWidth: _width * 0.3,
                            child: const Text(
                              "LIGHT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
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
                              await homeController.updateData(
                                  fieldName: "FAN_STATUS");
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_width * 0.2)),
                            color: homeController.fanColor,
                            height: _width * 0.3,
                            elevation: 5,
                            minWidth: _width * 0.3,
                            child: const Text(
                              "Fan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              await homeController.updateData(
                                  fieldName: "CHARGER_STATUS");
                            },
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_width * 0.2)),
                            color: homeController.chargerColor,
                            height: _width * 0.3,
                            minWidth: _width * 0.3,
                            child: const Text(
                              "Charger",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        onPressed: () async {
                          await homeController.syncData();
                        },
                        color: Colors.lightBlueAccent,
                        height: 50,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minWidth: 120,
                        child: const Text(
                          "Synk",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  );
                }),
          )),
    );
  }
}
