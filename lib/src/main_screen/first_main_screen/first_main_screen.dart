import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/widgets_exporter.dart';
import 'package:weatherapp/src/exporters/styles_exporter.dart';

class FirstMainScreen extends StatefulWidget {
  const FirstMainScreen({Key? key}) : super(key: key);

  @override
  _FirstMainScreenState createState() => _FirstMainScreenState();
}

class _FirstMainScreenState extends State<FirstMainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      title: 'weather_app',
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'weather status',
                    style: mainSmallFontStyle,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 80),
                    child: temperatureBlock()),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: additionalInfoBlock(),
                ),
                Container(
                  child: Text(
                    'user country',
                    style: mainSmallFontStyle,
                    ),
                  ),
              ],
            ),
          ),
        ),
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
