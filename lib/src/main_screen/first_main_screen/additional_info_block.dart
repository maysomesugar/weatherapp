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

Widget additionalInfoBlock({required String snow, required String clouds, required double wind}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const SizedBox(
        width: 60,
      ),
      additionalWidgetPartGenerator(Icons.ac_unit_rounded, snow),
      additionalWidgetPartGenerator(Icons.cloud, clouds),
      additionalWidgetPartGenerator(Icons.air, wind.toString()),
      const SizedBox(
        width: 60,
      ),
    ],
  );
}