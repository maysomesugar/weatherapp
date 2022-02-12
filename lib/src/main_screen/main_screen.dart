import 'package:weatherapp/src/main_screen/widgets_exporter.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/sky.jpg'),
              fit: BoxFit.cover,
            )),
            height: 1000,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'weather status',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                    ),
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
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
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
