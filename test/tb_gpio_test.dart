import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tb_gpio/tb_gpio.dart';

void main() {
  const MethodChannel channel = MethodChannel('tb_gpio');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TbGpio.platformVersion, '42');
  });
}
