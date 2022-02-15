import 'package:weatherapp/src/tools/convert_temperature.dart';


class WeatherModel {
  int? _temperature;
  int? _clouds;
  double? _windSpeed;
  String? _weatherDescription;
  String? _icon;
  String? _countryName;
  String? _cityName;

  int? get temperature => _temperature;
  int? get clouds => _clouds;
  double? get windSpeed => _windSpeed;
  String? get weatherDescription => _weatherDescription;
  String? get icon{
    return "http://openweathermap.org/img/w/$_icon.ico";
  }
  String? get countryName => _countryName;
  String? get cityName => _cityName;

  WeatherModel(){
    _temperature = 0;
    _clouds = 0;
    _windSpeed = 0;
    _weatherDescription = '';
    _icon = '';
    _countryName = '';
    _cityName = '';
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

  WeatherModel.byJson(Map<String, dynamic> jsonData){
    try{
      _temperature = int.parse(jsonData['main']['temp']);
      _clouds = int.parse(jsonData['clouds']['all']);
      _windSpeed = jsonData['wind']['speed'];

      //=============================

      var tempData = jsonData['weather'][0] as Map<String, dynamic>;

      _weatherDescription = tempData['description'].toString();
      _icon = tempData['icon'].toString();

      //=============================

      _countryName = jsonData['sys']['country'].toString();
      _cityName = jsonData['name'].toString();
    }
    catch(exception){
      print(exception);
      WeatherModel();
      throw exception;
    }
  }
  

}

//==============================================

//==============================================



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
