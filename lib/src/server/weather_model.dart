import 'package:weather/weather.dart';
import 'package:weatherapp/src/tools/convert_temperature.dart';

class WeatherModel {
  Map<String, dynamic>? _weather;
  Map<String, dynamic>? _main;
  Map<String, dynamic>? _wind;
  int? _clouds;
  String? _cityName;
  String? _countryName;

  //getters

  Map<String, dynamic>? get weather => _weather;//?
  Map<String, dynamic>? get main => _main;
  Map<String, dynamic>? get wind => _wind;
  int? get clouds => _clouds;
  String? get countryName => _countryName;
  String? get cityName => _cityName;
  //=======
  
  String? get mainStatuts => _weather?['main'];
  String? get description => _weather?['description'];
  //Icon

  int? get temperature => DoubleToInt(KelvinToCelsium(_main?['temp']));
  int? get feelsLikeTemperature => DoubleToInt(KelvinToCelsium(_main?['feels_like']));
  int? get pressure => _main?['pressure'];
  int? get humidity => _main?['humidity'];

  double? get windSpeed => _wind?['speed'];
  int? get windDegrees => _wind?['deg'];

  //constructors

  WeatherModel(){
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
    _clouds = 0;
    _countryName = '';
    _cityName = '';
  }

  WeatherModel.byJson(Map<String, dynamic> jsonData){
    try{
      _main = jsonData['main'];
      _weather = jsonData['weather'][0] as Map<String, dynamic>;
      _wind = jsonData['wind'];
      _clouds = jsonData['clouds']['all'];
      _cityName = jsonData['name'];
      _countryName = jsonData['sys']['country'];
      print(_weather);
    }
    catch(exception){
      print(exception);
      WeatherModel();
      throw exception;
    }
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