import 'package:automation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:automation/config/config.dart';

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
              Config.appName,
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
                                  fieldName: Config.button1FirebaseFieldName);
                            },
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_width * 0.2)),
                            color: homeController.button1Color,
                            height: _width * 0.3,
                            minWidth: _width * 0.3,
                            child: const Text(
                              Config.button1Name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              await homeController.updateData(
                                  fieldName: Config.button2FirebaseFieldName);
                            },
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_width * 0.2)),
                            color: homeController.button2Color,
                            height: _width * 0.3,
                            minWidth: _width * 0.3,
                            child: const Text(
                              Config.button2Name,
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
                                  fieldName: Config.button3FirebaseFieldName);
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_width * 0.2)),
                            color: homeController.button3Color,
                            height: _width * 0.3,
                            elevation: 5,
                            minWidth: _width * 0.3,
                            child: const Text(
                              Config.button3Name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              await homeController.updateData(
                                  fieldName: Config.button4FirebaseFieldName);
                            },
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(_width * 0.2)),
                            color: homeController.button4Color,
                            height: _width * 0.3,
                            minWidth: _width * 0.3,
                            child: const Text(
                              Config.button4Name,
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
