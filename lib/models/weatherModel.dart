class Weather {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double lon;
  final double lat;
  final double speed;
  final int degree;
  final String city;
  //final String icon;

  Weather({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.lon,
    required this.lat,
    required this.speed,
    required this.degree,
    required this.city,
    //required this.icon
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temp: json['main']['temp'],
        feelsLike: json['main']['feels_like'],
        tempMin: json['main']['temp_min'],
        tempMax: json['main']['temp_max'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        lon: json['coord']['lon'],
        lat: json['coord']['lat'],
        speed: json['wind']['speed'],
        degree: json['wind']['deg'],
        city: json['name']
        //icon: json['weather']['icon'],
        );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['temp'] = this.temp;
  //   data['feels_like'] = this.feelsLike;
  //   data['temp_min'] = this.tempMin;
  //   data['temp_max'] = this.tempMax;
  //   data['pressure'] = this.pressure;
  //   data['humidity'] = this.humidity;
  //   return data;
  // }
}
