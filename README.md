# tb_gpio

gpio FFI plugin for Tinker Board S
Android only

C Codes from https://github.com/TinkerBoard/gpio_lib_python


# set up GPIO output channel, we set GPIO4 (Pin 7) to OUTPUT
```dart
import 'gpio.dart';

tbgpio.setup() //open `/dev/gpiomem` & mmap
tbgpio.setup_gpio(187, OUTPUT, PUD_UP);
void output_gpio(int gpio, int value)
int input_gpio(int gpio)
cleanup()
```


## using ffgen

add ffgen in pubspec.yaml
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

```shell
flutter pub run ffgen
```

## Build libtbgpio.so
```shell
cd example
flutter run
```





