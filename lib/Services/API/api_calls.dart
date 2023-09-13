import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sizer/sizer.dart';
import '../../common/snackbars/error_snack_bar.dart';
import 'api_urls.dart';
import 'app_exceptions.dart';

class ApiCalls {
  static Future<dynamic> getRequestData(String apiEndPoint, BuildContext context,
      {bool sendToken = true}) async {
    String apiURLAddress = ApiUrls.baseUrl + apiEndPoint;
    debugPrint("URL: " + apiURLAddress);
    var responseJson;
    try {
      var response = await dio.Dio().get(
        apiURLAddress,
        options: dio.Options(
          headers:
          {
            "Accept": "application/json",
          },
        ),
      );
      responseJson = _returnListResponse(response);
      return responseJson;
    } on dio.DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout) {
        ConnectionErrorException();
      }
      if (e.response!.data["message"].runtimeType == String) {
        errorSnackbar(
          context,
          Text(
            e.response!.data["message"],
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black,
            ),
          ),
        );
      } else {
        errorSnackbar(
          context,
          Text(
            e.response!.data["message"],
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black,
            ),
          ),
        );
      }
      return null;
    }
  }


}

dynamic _returnListResponse(Response<dynamic> response) {
  print("StatusCode: ${response.statusCode}");
  switch (response.statusCode) {
    case 200:
      var responseJson = response.data;
      return responseJson;
    case 201:
      var responseJson = response.data;
      return responseJson;
    case 204:
      var responseJson = "User Created";
      return responseJson;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
      throw UnauthorisedException(response.data.toString());
    case 404:
      throw RequestNotFoundException(response.data.toString());
    case 403:
      throw UnautorizationException(response.data.toString());
    case 409:
      var responseJson = json.decode(response.data.toString());
      return responseJson;
    case 500:
      throw InternalServerException(response.data.toString());
    case 503:
      throw ServerNotFoundException(response.data.toString());
    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
