import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';

Widget temperatureBlock() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '13',
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
            margin: EdgeInsets.only(top: 90, left: 10),
            child: Text('C',
                style: mainMiddleFontStyle,
            ),
          )
        ],
      )
    ],
  );
}
