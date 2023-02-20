import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sayabidev_group_assign_1/models/weatherModel.dart';

Future fetchAlbum(String city) async {
  Weather weather;
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=49af9cb86e2808aee7262f5cbcd7b751'));

  if (response.statusCode == 200) {
    weather = Weather.fromJson(jsonDecode(response.body));
    // return response;
    print(response.body);
  } else {
    throw Exception('Failed to load album');
  }
  return weather;
}

Future fetchdaily(double lat, double lon) async {
  Weather weather;
  final response = await http.get(Uri.parse(
      'api.openweathermap.org/data/2.5/forecast/daily?lat=$lat&lon=$lon&cnt=5&appid=49af9cb86e2808aee7262f5cbcd7b751'));
  if (response.statusCode == 200) {
    //weather = Weather.fromJson(jsonDecode(response.body));
    // return response;
    print(response.body);
  } else {
    throw Exception('Failed to load album');
  }
  // return weather;
}
