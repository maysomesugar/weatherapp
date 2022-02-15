import 'package:weather/weather.dart';

Future<Weather> getWeather() async {
  var latitude = 48.5188;
  var longitude = 34.5751;

  late Weather weather;
  late WeatherFactory weatherFactory;
  try {
    WeatherFactory weatherFactory = WeatherFactory(
      '1e97ef2a59ba9684671e50a56d3cdd81',
      language: Language.RUSSIAN,
    );
    weather =
        await weatherFactory.currentWeatherByLocation(latitude, longitude);
  } catch (e) {
    throw e;
  }

  return weather;
}

Future<Map<String, dynamic>> getWeatherMap() async {
  var weather = await getWeather()
    ..toJson();
  var data = weather.toJson();
  Map<String, dynamic> weatherData = {'main': data?['main']['main']};
  return weatherData;
}
