import 'package:flutter_test/flutter_test.dart';
import 'package:mklocal_search/mklocal_search.dart';
import 'package:mklocal_search/mklocal_search_platform_interface.dart';
import 'package:mklocal_search/mklocal_search_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMklocalSearchPlatform
    with MockPlatformInterfaceMixin
    implements MklocalSearchPlatform {
  @override
  Future<MklocalSearchResonse?> naturalLanguageQuery(String query) =>
      Future.value(null);
}

void main() {
  final MklocalSearchPlatform initialPlatform = MklocalSearchPlatform.instance;

  test('$MethodChannelMklocalSearch is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMklocalSearch>());
  });

  test('naturalLanguageQuery', () async {
    MklocalSearch mklocalSearchPlugin = MklocalSearch();
    MockMklocalSearchPlatform fakePlatform = MockMklocalSearchPlatform();
    MklocalSearchPlatform.instance = fakePlatform;

    expect(await mklocalSearchPlugin.naturalLanguageQuery('apple store'),
        isNotNull);
  });
}
