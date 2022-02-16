import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';

Widget additionalWidgetPartGenerator(IconData icon, String text){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Container(
          child: Icon(
            icon,
            size: 40,
          ),
        ),
        Container(
          child: Text(
            text,
            style: mainSmallFontStyle,
          ),
        ),
      ],
    ),
  );
}

Widget additionalInfoBlock({required int humidity, required int pressure, required double wind}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const SizedBox(
        width: 60,
      ),
      additionalWidgetPartGenerator(Icons.opacity, '${humidity.toString()} %'),
      additionalWidgetPartGenerator(Icons.cloud, '${pressure.toString()} гПа'),
      additionalWidgetPartGenerator(Icons.air, '${wind.toString()} м/с'),
      const SizedBox(
        width: 60,
      ),
    ],
  );
}