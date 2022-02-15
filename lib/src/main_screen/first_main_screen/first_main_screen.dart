import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/widgets_exporter.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';
//
import 'package:weatherapp/src/server/weather_model.dart';
import 'package:weatherapp/src/server/weather_model_old.dart';

class FirstMainScreen extends StatefulWidget {
  const FirstMainScreen({Key? key}) : super(key: key);

  @override
  _FirstMainScreenState createState() => _FirstMainScreenState();
}

class _FirstMainScreenState extends State<FirstMainScreen> {
  WeatherModel_old currentWeather = WeatherModel_old();

  void getWeather() async {
    // Map<String, dynamic> jsonData = (await getWeatherFromDB()).toJson();
    currentWeather = WeatherModel_old.fromJson(await getWeatherFromDB());
    setState(() {
    print('setState');
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
            currentWeather.main,
            style: mainSmallFontStyle,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 80),
            child: temperatureBlock(currentWeather.temperature)),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: additionalInfoBlock(snow: currentWeather.description,clouds: currentWeather.description ,wind: currentWeather.windSpeed  ),
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
