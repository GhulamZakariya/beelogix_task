import 'dart:io';
import 'package:flutter/material.dart';

import '../../Models/MdImages.dart';
import '../../main.dart';
import '../../services/API/api_calls.dart';
import '../../services/API/api_response.dart';
import '../../services/API/api_urls.dart';
import '../API/app_exceptions.dart';

class PhotoService {
  Future<ApiResponse<ImageResponseModel>> getLoginData(BuildContext context,
      {String? phoneNumber, String? password}) async {
    try {


      var response =
      await ApiCalls.getRequestData(ApiUrls.getPhotos,context);
      print("LoginApiResponse: $response");
      ImageResponseModel responseModel=ImageResponseModel.fromJson(response);
      debugPrint(" Data Save in model classs     ${responseModel.toJson()}");
      photoesGalleryController.setphotoesResponseModel = responseModel;
      return ApiResponse.completed(responseModel);
    } on BadRequestException {
      return ApiResponse.error('Bad Request Exception');
    } on UnauthorisedException {
      return ApiResponse.error('The User is Un-authorized');
    } on RequestNotFoundException {
      return ApiResponse.error('Request Not Found');
    } on UnautorizationException {
      return ApiResponse.error('The User is Un-authorized');
    } on InternalServerException {
      return ApiResponse.error('Internal Server Error');
    } on ServerNotFoundException {
      return ApiResponse.error('Server Not Available');
    } on FetchDataException {
      return ApiResponse.error('An Error occurred while Fetching the Data');
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
