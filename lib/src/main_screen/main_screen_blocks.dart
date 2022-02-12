import 'package:flutter/material.dart';

Widget temperatureBlock() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '13',
        style: TextStyle
          (fontFamily: 'Montserrat',
            fontSize: 120
        ),
      ),
      Stack(
        children: [
          Container(
            child: Text(
              '°',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 120
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 90, left: 10),
            child: Text('C',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30
                )
            ),
          )
        ],
      )
    ],
  );
}
