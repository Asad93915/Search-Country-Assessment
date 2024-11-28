import 'package:search_countries_assessment/app/utils/api_url.dart';

import '../api_provider/api_provider.dart';

class CountriesRepository {
  CountriesRepository._privateConstructor();

  static final CountriesRepository _instance =
      CountriesRepository._privateConstructor();

  static CountriesRepository get instance => _instance;

  factory CountriesRepository() {
    return _instance;
  }

  final ApiManager _apiManager = ApiManager();

  Future<dynamic> searchCounty({required String searchCountry}) async {
    return await _apiManager.requestHttpAPi(
        "${ApiUrls.searchUrl}$searchCountry",
        method: APIMethod.get);
  }
}
