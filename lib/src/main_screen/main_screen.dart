import 'package:flutter/material.dart';
import 'package:weatherapp/src/exporters/widgets_exporter.dart';
import 'package:weatherapp/src/main_screen/first_main_screen/first_main_screen.dart';
import 'package:weatherapp/src/main_screen/second_main_screen/second_main_screen.dart';
import 'package:weatherapp/src/server/weather_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherModel currentWeather = WeatherModel();

  void getWeather() async {
    var tempWeather = WeatherModel.byJson(await getWeatherFromDB());
    print(currentWeather);
    setState(() {
      currentWeather = tempWeather;
      print(currentWeather);
    });
  }

  @override
  void initState(){
    super.initState();
    getWeather();
  }

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
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(currentWeather.weatherBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListView(
              children: [
                FirstMainScreen(currentWeather),
                SecondMainScreen(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Stack(
// children: [
// Container(
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage('assets/images/clear_sky.jpg'),
// fit: BoxFit.cover,
// )
// ),
// ),
// ListView(
// children: [
// FirstMainScreen(),
// SecondMainScreen(),
// ],
// )
// ],
// ),

// Container(
// decoration: BoxDecoration(
// color: Colors.red,
// ),
// height: 100,
// width: 100,
// )
