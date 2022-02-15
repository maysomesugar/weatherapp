import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';

Widget temperatureBlock(int? temperature) {
  return Row(
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
  );
}
