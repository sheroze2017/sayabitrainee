import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sayabidev_group_assign_1/Api/weatherApi.dart';
import '../models/weatherModel.dart';

class cityData extends GetxController {
  var data = [273.15, 273.15, 273.15, 273.15, 0, 0, 0.0, 0.0, 0.0, 0].obs;
  var temp = 0.0.obs;
  var feelsLike = 0.0.obs;
  var tempMin = 0.0.obs;
  var tempMax = 0.0.obs;
  var pressure = 0.obs;
  RxInt humidity = 0.obs;
  var lon = 0.0.obs;
  var lat = 0.0.obs;
  var speed = 0.0.obs;
  var degree = 0.0.obs;

  var cityName = ['City'].obs;
  var isLoading = true.obs;
  void fetchData(city) async {
    try {
      //data.clear();

      isLoading(true);
      var dataTemp = await fetchAlbum(city);
      if (dataTemp != null) {
        data.add(dataTemp.temp);
        data.add(dataTemp.feelsLike);
        data.add(dataTemp.tempMin);
        data.add(dataTemp.tempMax);
        data.add(dataTemp.pressure);
        data.add(dataTemp.humidity);
        data.add(dataTemp.lon);
        data.add(dataTemp.lat);
        data.add(dataTemp.speed);
        data.add(dataTemp.degree);
        cityName.add(dataTemp.city);
        //cityName.replaceRange(0, 1, dataTemp.city);
        data.removeRange(0, (data.length - 10));
        cityName.removeAt(0);
        //   data.add(icont);
      }
    } finally {
      isLoading(false);
    }
  }
}
