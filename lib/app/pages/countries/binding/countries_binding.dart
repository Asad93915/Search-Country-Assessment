
import 'package:get/get.dart';
import 'package:search_countries_assessment/app/pages/countries/controller/countries_controller.dart';

class CountriesBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>CountriesController());
  }

}