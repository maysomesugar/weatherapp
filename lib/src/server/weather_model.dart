import 'package:flutter/material.dart';
import 'package:weatherapp/src/tools/convert_temperature.dart';

class WeatherModel {
  Map<String, dynamic>? _weather;
  Map<String, dynamic>? _main;
  Map<String, dynamic>? _wind;
  String? _cityName;
  String? _countryName;

  //getters

  String get mainStatus => _weather?['main'] ?? 'unknown';
  String get description => _weather?['description'] ?? 'unknown';
  Image get icon => _getIconFromCode(_weather?['icon']  ?? '');
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

  Image _getIconFromCode(String code){
    String imagePath;

    switch (code) {
      case '01d':
        imagePath = 'assets/weather_status/sunny.png';
        break;
      case '01n':
        imagePath = 'assets/weather_status/moon.png';
        break;
      case '11d':
        imagePath = 'assets/weather_status/thunderstorm.png';
        break;
      case '09d':
      case '10d':
        imagePath = 'assets/weather_status/rainy_day.png';
        break;
      case '13d':
        imagePath = 'assets/weather_status/snow.png';
        break;
      case '50d':
        imagePath = 'assets/weather_status/haze.png';
        break;
      case '02d':
        imagePath = 'assets/weather_status/clear_sky.png';
        break;
      case '02n':
        imagePath = 'assets/weather_status/cloudy_night.png';
        break;
      case '03d':
      case '03n':
      case '04d':
      case '04n':
        imagePath = 'assets/weather_status/cloud.png';
        break;
      default:
        imagePath = 'assets/weather_status/sunny.png';
        break;
    }

    return Image.asset(
      imagePath,
      width: 75,
    );
  }
}
