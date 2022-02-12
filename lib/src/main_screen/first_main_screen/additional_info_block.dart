import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';

Widget additionalWidgetPartGenerator(IconData icon, String text){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
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

Widget additionalInfoBlock(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const SizedBox(
        width: 60,
      ),
      additionalWidgetPartGenerator(Icons.ac_unit_rounded, 'some_text'),
      additionalWidgetPartGenerator(Icons.cloud, 'some_text'),
      additionalWidgetPartGenerator(Icons.air, 'some_text'),
      const SizedBox(
        width: 60,
      ),
    ],
  );
}