import 'package:weather/weather.dart';

//hardcode
var latitude = 48.5188;
var longitude = 34.5751;

WeatherFactory _wf = WeatherFactory(
  '1e97ef2a59ba9684671e50a56d3cdd81',
  language: Language.RUSSIAN,
);

Future getWeatherFromDB() async {
  try {
    Weather weather = await _wf.currentWeatherByLocation(latitude, longitude);
    return weather;
  } catch (e) {
    throw e;
  }
}
