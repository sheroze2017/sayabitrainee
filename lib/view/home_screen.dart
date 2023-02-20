import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:sayabidev_group_assign_1/Api/weatherApi.dart';
import 'package:sayabidev_group_assign_1/models/weatherModel.dart';
import 'package:weather_icons/weather_icons.dart';

import '../controller/cityData.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final TextEditingController textController = TextEditingController();
    final controller = Get.put(cityData());

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: width,
                height: height / 2,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 3, 192, 244),
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(30.0),
                    bottomRight: const Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 20,
                    ),
                    Obx(
                      () => Text(
                        '${controller.cityName[0]} Weather',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height / 12,
                          width: width * 0.7,
                          child: TextFormField(
                              controller: textController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 3, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              )),
                        ),
                        InkWell(
                            onTap: () async {
                              controller.fetchData(textController.text);
                            },
                            child: Icon(Icons.search))
                      ],
                    ),
                    Card(
                      color: Color.fromARGB(255, 3, 192, 244),
                      child: SizedBox(
                        width: width * 0.9,
                        height: height / 4.5,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Currently',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Obx(
                                    () => Text(
                                      '${(controller.data[0] - 273.15).toString().split('.')[0]}°C',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      'Feels like ${(controller.data[1] - 273.15).toString().split('.')[0]}°C',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 11,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Longitude',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                          color: Colors.black38)),
                                  Obx(
                                    () => Text(
                                      '${controller.data[6]}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text('Latitude',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                          color: Colors.black38)),
                                  Obx(
                                    () => Text(
                                      '${controller.data[7]}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: SizedBox(
                      width: width / 3.5,
                      height: height / 5,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${(controller.data[2] - 273.15).toString().split('.')[0]}' +
                                  '/' +
                                  '${(controller.data[3] - 273.15).toString().split('.')[0]}°C',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ),
                          Icon(Icons.thermostat_sharp),
                          Text(
                            'Min/Max',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 8,
                                color: Colors.black38),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: width / 3.5,
                      height: height / 5,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${controller.data[4]} Pa',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ),
                          Icon(Icons.av_timer),
                          Text(
                            'Pressure',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 9,
                                color: Colors.black38),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: width / 3.5,
                      height: height / 5,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              ' ${controller.data[5]} g.m-3',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ),
                          Icon(WeatherIcons.humidity),
                          Text(
                            'Humidity',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 9,
                                color: Colors.black38),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: SizedBox(
                      width: width / 3.5,
                      height: height / 5,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${controller.data[8]} Km/h',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ),
                          Icon(Icons.speed),
                          Text(
                            'Wind Speed',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 8,
                                color: Colors.black38),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: width / 3.5,
                      height: height / 5,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Obx(
                            () => Text(
                              '${controller.data[9]}°',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ),
                          Icon(Icons.directions),
                          Text(
                            'Direction',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 9,
                                color: Colors.black38),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
