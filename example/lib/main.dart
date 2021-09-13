import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tb_gpio/tb_gpio.dart';
import 'gpio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _gpioValue = -999;
  final int pin = 187;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    tbgpio.setup();
    tbgpio.setup_gpio(pin, INPUT, PUD_UP);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    int gpioValue;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      gpioValue = tbgpio.input_gpio(pin);
    } on Exception {
      gpioValue = -99;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _gpioValue = gpioValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_gpioValue\n'),
        ),
      ),
    );
  }
}
