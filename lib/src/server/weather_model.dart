import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/src/tools/convert_temperature.dart';

class WeatherModel {
  Map<String, dynamic>? _weather;
  Map<String, dynamic>? _main;
  Map<String, dynamic>? _wind;
  String? _cityName;
  String? _countryName;
  String? _weatherBackground;

  //getters

  String get mainStatus => _weather?['main'] ?? 'unknown';
  String get description => _weather?['description'] ?? 'unknown';
  Image get icon => _getIconFromCode(_weather?['icon']  ?? '')['icon'];
  int get temperature => KelvinToCelsium(_main?['temp']).round();
  int get feelsLikeTemperature => KelvinToCelsium(_main?['feels_like']).round();
  int get pressure => _main?['pressure'] ?? 0;
  int get humidity => _main?['humidity'] ?? 0;

  double get windSpeed => _wind?['speed'] ?? 0;
  int get windDegrees => _wind?['deg'] ?? 0 ;

  String get countryName => _countryName ?? 'unknown location';
  String get cityName => _cityName ?? '';
  String get weatherBackground => _getIconFromCode(_weather?['icon']  ?? '')['background'];

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

  Map<String, dynamic> _getIconFromCode(String code){
    String imagePath;
    String backgroundPath;

    switch (code) {
      case '01d':
        imagePath = 'assets/weather_status/sunny.png';
        backgroundPath = 'assets/images/clear_sky.jpg';
        break;
      case '01n':
        imagePath = 'assets/weather_status/moon.png';
        backgroundPath = 'assets/images/night_clear_sky.jpg';
        break;
      case '11d':
        imagePath = 'assets/weather_status/thunderstorm.png';
        backgroundPath = 'assets/images/thunder.jpg';
        break;
      case '09d':
      case '10d':
        imagePath = 'assets/weather_status/rainy_day.png';
        backgroundPath = 'assets/images/rain.jpg';
        break;
      case '13d':
        imagePath = 'assets/weather_status/snow.png';
        backgroundPath = 'assets/images/snow.jpg';
        break;
      case '50d':
        imagePath = 'assets/weather_status/haze.png';
        backgroundPath = 'assets/images/haze.jpg';
        break;
      case '02d':
        imagePath = 'assets/weather_status/clear_sky.png';
        backgroundPath = 'assets/images/clear_sky.jpg';
        break;
      case '02n':
        imagePath = 'assets/weather_status/cloudy_night.png';
        backgroundPath = 'assets/images/cloudy_night.jpg';
        break;
      case '03d':
      case '03n':
      case '04d':
      case '04n':
        imagePath = 'assets/weather_status/cloud.png';
        backgroundPath = 'assets/images/cloudy.jpg';
        break;
      default:
        imagePath = 'assets/weather_status/sunny.png';
        backgroundPath = 'assets/images/clear_sky.jpg';
        break;
    }

    return <String, dynamic>{
      'icon': Image.asset(imagePath,width: 75, color: Colors.black.withOpacity(0.8)),
      'background': backgroundPath
    };
  }

  @override
  String toString(){
    return 'temp = $temperature, status = $description';
  }
}
