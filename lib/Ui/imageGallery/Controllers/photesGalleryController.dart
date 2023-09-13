
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Models/MdImages.dart';


class PhotoesGalleryController extends GetxController {


  Rx<ImageResponseModel> photoesResponseModel = ImageResponseModel().obs;
  set setphotoesResponseModel(ImageResponseModel data) {
    photoesResponseModel.value = data;
    debugPrint(" Data Save in model Cont     ${photoesResponseModel.toJson()}");
    update();
  }


}
