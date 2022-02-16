import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/src/tools/convert_temperature.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class WeatherModel {
  Map<String, dynamic>? _weather;
  Map<String, dynamic>? _main;
  Map<String, dynamic>? _wind;
  String? _cityName;
  String? _countryName;

  //getters

  //=======

  String get mainStatuts => _weather?['main'] ?? 'unknown';
  String get description => _weather?['description'] ?? 'unknown';
  IconData get icon => getIconFromCode(_weather?['icon'] ?? '');
  int get temperature => KelvinToCelsium(_main?['temp']).round();
  int get feelsLikeTemperature => KelvinToCelsium(_main?['feels_like']).round();
  int get pressure => _main?['pressure'] ?? 0;
  int get humidity => _main?['humidity'] ?? 0;

  double get windSpeed => _wind?['speed'] ?? 0;
  int get windDegrees => _wind?['deg'] ?? 0 ;

  String get countryName => _countryName ?? 'unknown location';
  String get cityName => _cityName ?? '';
  //constructors

  WeatherModel() {
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
    _wind = {
      'speed': 7.87,
      'deg': 182,
    };
    _countryName = '';
    _cityName = '';
  }

  WeatherModel.byJson(Map<String, dynamic> jsonData) {
    try {
      _main = jsonData['main'];
      _weather = jsonData['weather'][0] as Map<String, dynamic>;
      _wind = jsonData['wind'];
      _cityName = jsonData['name'];
      _countryName = jsonData['sys']['country'];
    } catch (exception) {
      print(exception);
      WeatherModel();
      throw exception;
    }
  }
  IconData getIconFromCode(String code){
    IconData tempIcon;

    if(code == '01d'){
      tempIcon = WeatherIcons.wiDaySunny;
    }
    else {
      tempIcon = WeatherIcons.wiDaySunny;
    }
    return tempIcon;
  }

// WeatherModel.manually({temperature = 0, clouds = 0, windSpeed = 0,
//   weatherDescription = '', icon = '', countryName = '', cityName = ''}){
//   _temperature = temperature;
//   _clouds = clouds;
//   _windSpeed = windSpeed;
//   _weatherDescription = weatherDescription;
//   _icon = icon;
//   _countryName = countryName;
//   _cityName = cityName;
// }
}

//TODO:
/*
Не удобно работать с классом, изза чего в виджетах получаются длиннае строки с выборкой данных
-нужно сделать пару основных приватных полей и геттерами из них изымать нужные данные



*/
