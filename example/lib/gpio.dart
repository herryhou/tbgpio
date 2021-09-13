import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX

import 'package:tb_gpio/tb_gpio.dart';

// import 'package:flutter/services.dart';
late final DynamicLibrary nativeAddLib = Platform.isAndroid
    ? DynamicLibrary.open("libtbgpio.so")
    : DynamicLibrary.process();

late final tbgpio = TBGpio(nativeAddLib);
