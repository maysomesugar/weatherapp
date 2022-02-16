import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/widgets_exporter.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';
import 'package:weatherapp/src/tools/convert_temperature.dart';

class FirstMainScreen extends StatefulWidget {
  final currentWeather;

  const FirstMainScreen(this.currentWeather, {Key? key}) : super(key: key);

  @override
  _FirstMainScreenState createState() => _FirstMainScreenState();
}

class _FirstMainScreenState extends State<FirstMainScreen> {
  @override
  Widget build(BuildContext context) {

    var currentWeather = widget.currentWeather;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Text(
              FirstSymbolToUpperCase(currentWeather.description),
              style: mainSmallFontStyle,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: temperatureBlock(
                temperature: currentWeather.temperature,
                currentWeatherIcon: currentWeather.icon, //currentWeather.icon,
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: additionalInfoBlock(
              humidity: currentWeather.humidity,
              pressure: currentWeather.pressure,
              wind: currentWeather.windSpeed,
            ),
          ),
          Container(
            child: Text(
              '${currentWeather.cityName}, ${currentWeather.countryName}',
              style: mainSmallFontStyle,
            ),
          ),
        ],
      ),
    );
  }
}
