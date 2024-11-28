import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_countries_assessment/app/global_components/snack_bar_taosts.dart';
import 'package:search_countries_assessment/app/pages/countries/controller/countries_controller.dart';
import 'package:search_countries_assessment/app/utils/app_colors.dart';
import 'package:search_countries_assessment/app/utils/text_style.dart';

class CountriesView extends GetView<CountriesController> {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Search Countries",
          style: bodyLargeWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name of Country",
              style: bodyLarge,
            ),
            TextFormField(
              style: bodyMedium,
              autofocus: true,
              controller: controller.searchCont,
              decoration: InputDecoration(
                hintStyle: bodySmall,
                hintText: "Enter name of country",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: AppColors.blackColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: AppColors.redColor),
                ),
              ),
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
            ).paddingOnly(top: 10.0),
            Obx(() {
              if (controller.searchLoading.value) {
                // Show loading indicator
                return SizedBox(
                  height: Get.height * 0.5,
                  child: Center(child: customCircularIndicator()),
                );
              } else if (controller.searchQuery.isEmpty) {
                return const SizedBox.shrink();
              } else if (controller.searchQuery.value.trim().isNotEmpty &&
                  controller.searchResult.isEmpty) {
                // No results found
                return Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      "https://www.eazycure.com/storage/media/error/no_data_found.png",
                    ).paddingOnly(top: 20.0, left: 10, right: 10),
                  ),
                );
              } else {
                // Display search results
                return ListView.builder(
                  itemCount: controller.searchResult.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final country = controller.searchResult[index];
                    return Card(
                      color: AppColors.whiteColor,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      child: ListTile(
                        leading: Image.network(
                          country.flags?.png ?? "",
                          height: 35.0,
                          width: 35.0,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.flag, size: 35),
                        ),
                        title: Text(
                          country.name?.common ?? "Unknown Country",
                          style: bodyLarge,
                        ),
                        subtitle: Text(
                          country.region ?? "Unknown Region",
                          style: bodyMediumLightBlack,
                        ),
                        trailing: Text(
                          controller.numFmt.format(country.population ?? 0),
                          style: bodySmall,
                        ),
                      ),
                    );
                  },
                ).paddingOnly(top: 15.0);
              }
            })
          ],
        ).paddingSymmetric(
            horizontal: Get.width * 0.05, vertical: Get.height * 0.03),
      ),
    );
  }
}
