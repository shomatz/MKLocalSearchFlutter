import 'package:mklocal_search/models/mklocal_search_resonse.dart';
import 'mklocal_search_platform_interface.dart';

export 'package:mklocal_search/models/mklocal_search_resonse.dart';

class MklocalSearch {
  Future<MklocalSearchResonse?> naturalLanguageQuery(String query) {
    return MklocalSearchPlatform.instance.naturalLanguageQuery(query);
  }
}
