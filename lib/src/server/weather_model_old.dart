import 'package:weatherapp/src/tools/convert_temperature.dart';

import 'package:flutter/material.dart';

class WeatherModel_old {
  late Map<String, dynamic> _weather;
  late Map<String, dynamic> _main;
  //late int _visibility;
  late Map<String, dynamic> _wind;
  late String _countryName;
  late String _cityName;

  String get main => _weather['main'];
  String get description => _weather['description'];
  Image get icon => Image.network(
      'https://openweathermap.org/img/wn/${_weather['icon']}].png');

  int get temperature {
    return DoubleToInt(KelvinToCelsium(_main['temp']));
  }

  // int  get feelsLikeTemperature {
  //   return DoubleToInt(KelvinToCelsium(_main['feels_like']));
  // }

  // int get pressure => _main['pressure'];
  // int get hymidity => _main['humidity'];

  // int get visibility => _visibility;

  double get windSpeed => _wind['speed'];
  // int get degrees => _wind['deg'];

  String get countryName => _countryName;
  String get cityName => _cityName;



  //=========
  WeatherModel_old.fromJson(Map<String, dynamic> jsonData) {
    //_visibility = jsonData['visibility'];
    _weather = jsonData['weather'][0] as Map<String, dynamic>;
    _main = jsonData['main'];
    _wind = jsonData['wind'];
    //
    _countryName = jsonData['sys']['country'];
    _cityName = jsonData['name'];
  }

  WeatherModel_old() {
    _weather = {
      'main': 'Please wait',
      'description': 'Please wait',
      'icon': '04d',
    };
    _main = {
      'temp': 275.01,
      'feels_like': 269.29,
      'pressure': 1008,
      'humidity': 96,
    };
    //_visibility = 100;
    _wind = {
      'speed': 7.87,
      'deg': 182,
    };
    _countryName = 'Cheking';
    _cityName = '';
  }
}

//-----Needed parameters
// icon -> https://openweathermap.org/img/wn/${['weather']['icon']}].png
//
//weather:  main
//          description
//          icon
//main:     temp
//          feels_like
//          pressure
//          humidity
//visibility
//wind:     speed
//          deg -TODO: find direction



// {"coord":{"lon":34.5751,"lat":48.5188},
// "weather":[{"id":804,
//             "main":"Clouds",
//             "description":"overcast clouds",
// 000---      "icon":"04d"}],
// "main":{"temp":275.01,
// 000---   "feels_like":269.29,
//          "temp_min":275.01,
//          "temp_max":275.33,
// 000---   "pressure":1008,
//          "humidity":96,
//          "sea_level":1008,
//          "grnd_level":993},
// 000---"visibility":10000,
// 000---"wind":{"speed":7.87,
//           "deg":182,
//           "gust":15.56},
// 000---"name":"Kamianske",
// 
// 
// 
// ---"clouds":{"all":100},
// ----"base":"stations",
// ----"dt":1644229029,
// ----"sys":{"type":2,
//        "id":2024060,
//        "country":"UA",
//        "sunrise":1644210165,
//        "sunset":1644245337},
// ----"timezone":7200,
// ----"id":709932,
// ----"cod":200}
