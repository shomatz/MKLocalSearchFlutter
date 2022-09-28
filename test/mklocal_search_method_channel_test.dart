import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mklocal_search/mklocal_search_method_channel.dart';

void main() {
  MethodChannelMklocalSearch platform = MethodChannelMklocalSearch();
  const MethodChannel channel = MethodChannel('mklocal_search');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return null;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.naturalLanguageQuery('apple store'), isNotNull);
  });
}
