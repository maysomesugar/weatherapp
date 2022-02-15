import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';
import 'package:weather_icons/weather_icons.dart';

Widget temperatureBlock({required int? temperature, required String? currentWeatherIcon}) {

  IconData icon = Icons.ac_unit_rounded;

  switch(currentWeatherIcon){
    case '01d': icon = Icons.ac_unit_rounded; break;
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        child: Icon(icon),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$temperature',
            style: mainBigFontStyle,
          ),
          Stack(
            children: [

              Container(
                child: Text(
                  '°',
                  style: mainBigFontStyle,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 90, left: 10),
                child: Text('C',
                  style: mainMiddleFontStyle,
                ),
              )
            ],
          )
        ],
      )
    ],
  );
}
