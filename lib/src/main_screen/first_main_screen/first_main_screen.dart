import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/widgets_exporter.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';
import 'package:weatherapp/src/server/weather_model.dart';

class FirstMainScreen extends StatefulWidget {
  const FirstMainScreen({Key? key}) : super(key: key);

  @override
  _FirstMainScreenState createState() => _FirstMainScreenState();
}

class _FirstMainScreenState extends State<FirstMainScreen> {
  WeatherModel currentWeather = WeatherModel();

  void getWeather() async {
    // Map<String, dynamic> jsonData = (await getWeatherFromDB()).toJson();
    var tempWeather = WeatherModel.byJson(await getWeatherFromDB());
    setState(() {
      currentWeather = tempWeather;
      print(currentWeather.main?['temp']);
    });
  }

  @override
  void initState() {
    getWeather();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getWeather();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Text(
            currentWeather.weather?['description'],
            style: mainSmallFontStyle,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 80),
            child: temperatureBlock(temperature: (currentWeather.main?['temp'] - 273.15).round(), currentWeatherIcon: currentWeather.weather?['icon'])),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: additionalInfoBlock(humidity: currentWeather.main?['humidity'], pressure: currentWeather.main?['pressure'], wind: currentWeather.wind?['speed']),
        ),
        Container(
          child: Text(
            '${currentWeather.cityName}, ${currentWeather.countryName}',
            style: mainSmallFontStyle,
          ),
        ),
      ],
    );
  }
}

// Container(
// decoration: BoxDecoration(
// color: Colors.red,
// ),
// height: 100,
// width: 100,
// )
