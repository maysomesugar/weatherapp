import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/widgets_exporter.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';
import 'package:weatherapp/src/server/weather_model.dart';

WeatherModel currentWeather = WeatherModel();

class FirstMainScreen extends StatefulWidget {
  const FirstMainScreen({Key? key}) : super(key: key);

  @override
  _FirstMainScreenState createState() => _FirstMainScreenState();
}

class _FirstMainScreenState extends State<FirstMainScreen> {
  void  getWeather() async{
    var jsonData = jsonDecode(await getWeatherFromDB());

    setState(() {
      currentWeather = WeatherModel.byJson(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Text(
              '${currentWeather.weatherDescription}',
              // 'asda',
              style: mainSmallFontStyle,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: temperatureBlock(currentWeather.temperature)),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: additionalInfoBlock(),
          ),
          Container(
            child: Text(
              'user country',
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
