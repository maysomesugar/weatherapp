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
  Image get icon => _getImagesFromCode(_weather?['icon'] ?? '')['icon'];
  String get weatherBackground =>
      _getImagesFromCode(_weather?['icon'] ?? '')['background'];

  int get temperature => KelvinToCelsium(_main?['temp']).round();
  int get feelsLikeTemperature => KelvinToCelsium(_main?['feels_like']).round();
  int get pressure => _main?['pressure'] ?? 0;
  int get humidity => _main?['humidity'] ?? 0;

  double get windSpeed => _wind?['speed'] ?? 0;
  int get windDegrees => _wind?['deg'] ?? 0;

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

  Map<String, dynamic> _getImagesFromCode(String code) {
    String imagePath;
    String backgroundPath;

    if (code == '01d') {
      imagePath = 'assets/weather_status/sunny.png';
      backgroundPath = 'assets/images/clear_sky.jpg';
    } else if (code == '01n') {
      imagePath = 'assets/weather_status/moon.png';
      backgroundPath = 'assets/images/night_clear_sky.jpg';
    } else if (code == '11d') {
      imagePath = 'assets/weather_status/thunderstorm.png';
      backgroundPath = 'assets/images/thunder.jpg';
    } else if (code == '09d' || code == '10d') {
      imagePath = 'assets/weather_status/rainy_day.png';
      backgroundPath = 'assets/images/rain.jpg';
    } else if (code == '13d') {
      imagePath = 'assets/weather_status/snow.png';
      backgroundPath = 'assets/images/snow.jpg';
    } else if (code == '50d') {
      imagePath = 'assets/weather_status/haze.png';
      backgroundPath = 'assets/images/haze.jpg';
    } else if (code == '02d') {
      imagePath = 'assets/weather_status/clear_sky.png';
      backgroundPath = 'assets/images/clear_sky.jpg';
    } else if (code == '02n') {
      imagePath = 'assets/weather_status/cloudy_night.png';
      backgroundPath = 'assets/images/cloudy_night.jpg';
    } else if (code == '03d' ||
        code == '03n' ||
        code == '04d' ||
        code == '04n') {
      imagePath = 'assets/weather_status/cloud.png';
      backgroundPath = 'assets/images/cloudy.jpg';
    } else {
      imagePath = 'assets/weather_status/sunny.png';
      backgroundPath = 'assets/images/clear_sky.jpg';
    }

    return <String, dynamic>{
      'icon': Image.asset(imagePath,
          width: 75, color: Colors.black.withOpacity(0.8)),
      'background': backgroundPath
    };
  }

  @override
  String toString() {
    return 'temp = $temperature, status = $description';
  }
}


