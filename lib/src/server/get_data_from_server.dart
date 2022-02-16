import 'package:weather/weather.dart';

//hardcode
var Miami = [25.7751, -80.2105];
var Kamianske = [48.5188, 34.5751];
var Amur = [54.40, 130.0];

WeatherFactory _wf = WeatherFactory(
  '1e97ef2a59ba9684671e50a56d3cdd81',
  language: Language.RUSSIAN,
);

Future getWeatherFromDB() async {
  try {
    Weather weather = await _wf.currentWeatherByLocation(Kamianske[0], Kamianske[1]);
    return weather.toJson();
  } catch (e) {
    throw e;
  }
}
