import 'package:mklocal_search/models/mklocal_search_resonse.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mklocal_search_method_channel.dart';

abstract class MklocalSearchPlatform extends PlatformInterface {
  /// Constructs a MklocalSearchPlatform.
  MklocalSearchPlatform() : super(token: _token);

  static final Object _token = Object();

  static MklocalSearchPlatform _instance = MethodChannelMklocalSearch();

  /// The default instance of [MklocalSearchPlatform] to use.
  ///
  /// Defaults to [MethodChannelMklocalSearch].
  static MklocalSearchPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MklocalSearchPlatform] when
  /// they register themselves.
  static set instance(MklocalSearchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<MklocalSearchResonse?> naturalLanguageQuery(String query) {
    throw UnimplementedError('mklocalSearch() has not been implemented.');
  }
}
