import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../global_components/snack_bar_taosts.dart';
import '../utils/api_url.dart';




enum APIMethod { get, post, put, patch, delete }

class ApiManager {
  Future<dynamic> requestHttpAPi(String endPoint,
      {String baseUrl = ApiUrls.baseUrl,
        APIMethod method = APIMethod.post,
        Map<String, dynamic>? data,
        dynamic formData,
        bool isAuthenticated = true,
        bool isFormData = true}) async {
    final url = ApiUrls.baseUrl + endPoint;
    final uri = Uri.parse(url);
    debugPrint("URL : $url");
    debugPrint("Data : ${isFormData ? formData : data}");
    var headers = {
      "Accept": "application/json",

    };
    print("Headers $headers");
    dynamic resStr;
    http.Response response;
    try {
      switch (method) {
        case APIMethod.get:
          response = await http
              .get(uri, headers: headers)
              .timeout(const Duration(seconds: 30));
          break;
        case APIMethod.post:
          response = await http.post(uri,
              headers: headers, body: isFormData ? formData : jsonEncode(data));
          break;
        case APIMethod.put:
          response = await http
              .put(uri,
              headers: headers,
              body: isFormData ? formData : jsonEncode(data))
              .timeout(const Duration(seconds: 30));
          break;
        case APIMethod.patch:
          response = await http
              .patch(uri,
              headers: headers,
              body: isFormData ? formData : jsonEncode(data))
              .timeout(const Duration(seconds: 30));
          break;
        case APIMethod.delete:
          response = await http
              .delete(uri, headers: headers, body: jsonEncode(data))
              .timeout(const Duration(seconds: 30));
          break;
      }
      debugPrint(
          "End Point: $endPoint Response Status CODE: ${response.statusCode}");
      debugPrint(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401) {
        debugPrint("$endPoint===> user token expired");
     /*   successSnackBar(title: "Session End", message: "Please login again");
        closeApplicationTimer();
        Get.find<AuthService>().removeCurrentUser();
        Get.offAllNamed(AppRoutes.login);*/
      } else if(response.statusCode == 404){
        debugPrint("No Data found");
      }else {
        print("Else Case");
        try {
          var jsonData = jsonDecode(response.body);
          String message = jsonData["message"] ?? "";
          if (message.isNotEmpty) {
            customToastView(title: message);
          } else {
            customToastView(title: "Please try again");
            debugPrint("$endPoint===>No message found in api");
          }
        } catch (e) {
          customToastView(title: "Please try again");
          debugPrint("$endPoint===>exception in parsing body$e");
        }
      }
    } on SocketException {
      customToastView(title: 'No Internet Connection');
      debugPrint('End Point: $endPoint  No Internet connection 😑');
    } on TimeoutException catch (e) {
      customToastView(title: 'Api Response Timeout');
      debugPrint('End Point: $endPoint  Timeout Error: $e');
    } on HttpException catch (error) {
      debugPrint("End Point: $endPoint  Couldn't find the post 😱 $error");
    } on FormatException catch (error) {
      debugPrint("End Point: $endPoint  Bad response format 👎 $error");
    } catch (value) {
      debugPrint("End Point: $endPoint Exception in api request $value");
    }
    return resStr;
  }


}


