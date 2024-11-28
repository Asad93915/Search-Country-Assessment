import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:search_countries_assessment/app/pages/countries/binding/countries_binding.dart';
import 'package:search_countries_assessment/app/pages/countries/view/countries_view.dart';

abstract class AppRoutes {
  static const String countryPage = "/countryPage";
}

class AppPages {
  AppPages._();

  static var initialRoute = AppRoutes.countryPage;

  static final routes = [
    GetPage(
        name: AppRoutes.countryPage,
        page: () => CountriesView(),
        binding: CountriesBinding()),
  ];
}
