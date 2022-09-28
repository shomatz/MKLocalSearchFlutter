import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mklocal_search_platform_interface.dart';
import 'models/mklocal_search_resonse.dart';

/// An implementation of [MklocalSearchPlatform] that uses method channels.
class MethodChannelMklocalSearch extends MklocalSearchPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mklocal_search');

  @override
  Future<MklocalSearchResonse?> naturalLanguageQuery(String query) async {
    final jsonResponse = await methodChannel.invokeMethod<String?>(
        'naturalLanguageQuery', query);
    if (jsonResponse != null && jsonResponse.isNotEmpty) {
      return MklocalSearchResonse.fromJson(json.decode(jsonResponse));
    }
    return null;
  }
}
