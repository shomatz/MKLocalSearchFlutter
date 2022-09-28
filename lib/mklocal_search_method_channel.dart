part of mklocal_search;

/// An implementation of [MklocalSearchPlatform] that uses method channels.
class MethodChannelMklocalSearch extends MklocalSearchPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mklocal_search');

  @override
  Future<MklocalSearchResponse?> naturalLanguageQuery(String query) async {
    final jsonResponse = await methodChannel.invokeMethod<String?>(
        'naturalLanguageQuery', query);
    if (jsonResponse != null && jsonResponse.isNotEmpty) {
      return MklocalSearchResponse.fromJson(json.decode(jsonResponse));
    }
    return null;
  }
}
