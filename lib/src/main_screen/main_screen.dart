import 'package:flutter/material.dart';
import 'package:weatherapp/src/main_screen/first_main_screen/first_main_screen.dart';
import 'package:weatherapp/src/main_screen/second_main_screen/second_main_screen.dart';

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
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/clear_sky.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListView(
              children: const[
                FirstMainScreen(),
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
