# tb_gpio

A Flutter Plugin for accessing the Tinker Board S GPIO pins.

Android support only.

## Introduction
`tb_gpio` binds c code from tinker's [official C code](https://github.com/TinkerBoard/gpio_lib_python/tree/master/source) with dart:ffi.

## Plugin Installation

in `pubspec.yaml` add: 
```yaml
  tb_gpio:
    git:
      url: git://github.com/herryhou/tbgpio.git
      ref: main
```

## Usgae

Create a helper file `gpio.dart`

```dart
import 'dart:ffi';
import 'dart:io';
import 'package:tb_gpio/tb_gpio.dart';

late final DynamicLibrary nativeAddLib = Platform.isAndroid
    ? DynamicLibrary.open("libtbgpio.so")
    : DynamicLibrary.process();

late final tbgpio = TBGpio(nativeAddLib);
```

in main.dart

```dart
import 'package:tb_gpio/tb_gpio.dart';
import 'gpio.dart';

  // set GPIO4 (Pin 7) to INPUT with pull-up
  ...
  final int pin = 187;
  tbgpio.setup();
  tbgpio.setup_gpio(pin, INPUT, PUD_UP);

  int gpioValue = tbgpio.input_gpio(pin);

  tbgpio.cleanup();
  ...

```

> You might need to install NDK/CMake to compile C /C++ Codes to libtbgpio.so

---

## For Plugin developer


### using ffgen to gen `tb_gpio.dart`

add `ffgen` in `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2 
  ffi: ^1.1.2
  ffigen: ^4.0.0

ffigen:
  name: tb_gpio
  description: TinkerBoard GPIO
  output: './src/tb_gpio.dart'
  headers:
    entry-points:
      - './src/c_gpio.h'
```

```bash
flutter pub run ffgen
```

### Build `libtbgpio.so`

```shell
cd example
flutter run
```
