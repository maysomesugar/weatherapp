import 'package:flutter/material.dart';

class SecondMainScreen extends StatefulWidget {
  const SecondMainScreen({Key? key}) : super(key: key);

  @override
  _SecondMainScreenState createState() => _SecondMainScreenState();
}

class _SecondMainScreenState extends State<SecondMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0x3fd009eb),
    );
  }
}
