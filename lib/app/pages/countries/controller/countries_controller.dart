import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:search_countries_assessment/app/model/countries_model.dart';
import 'package:search_countries_assessment/app/repository/countries_repository.dart';

class CountriesController extends GetxController {
  final searchLoading = false.obs;
  final searchResult = <CountriesModel>[].obs;
  final searchCont = TextEditingController();
  final searchQuery = ''.obs;
  final numFmt = new NumberFormat("#,##0", "en_US");

  @override
  void onInit() {
    super.onInit();

    // Debounce searchQuery to trigger searchCountry after 500ms of no input
    debounce(
      searchQuery,
      (_) => searchCountry(),
      time: Duration(milliseconds: 500), // Adjust the delay as needed
    );
  }

  Future<void> searchCountry() async {
    if (searchQuery.trim().isNotEmpty) {
      searchResult.clear();
      searchLoading.value = true;
      try {
        await CountriesRepository.instance
            .searchCounty(searchCountry: searchQuery.value.trim())
            .then((value) {
          if (value != null) {
            var resStr = json.decode(value);
            for (var k in resStr) {
              searchResult.value.add(CountriesModel.fromJson(k));
            }
          } else {
            searchResult.clear();
          }
          debugPrint("Length of Countries List=======>${searchResult.length}");
        });
      } catch (e) {
        debugPrint("searchCountry=> exception $e");
      } finally {
        searchLoading.value = false;
      }
    } else {
      searchResult.clear();
      searchQuery.value = "";
    }
  }
}
