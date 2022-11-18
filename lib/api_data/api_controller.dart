import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_upload/api_data/UserModel.dart';
import 'package:image_upload/api_data/authApiProvider.dart';
import 'package:image_upload/camera_helper.dart';
import 'package:image_upload/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiController extends GetxController implements CameraOnCompleteListener {
  late AuthApiProvider _apiProvider;
  late CameraHelper cameraHelper;
  RxString imagePath = RxString("");

  @override
  void onInit() {
    _apiProvider = AuthApiProvider();
    cameraHelper = CameraHelper(this);
    super.onInit();
  }

  @override
  void onSuccessFile(String file, String fileType) {
    imagePath.value = file;
    initLogin();
  }

  Future initLogin() async {
    if (await Utils.hasNetwork()) {
      var image = imagePath.value;
      Utils.showLoader();
      var response = await _apiProvider.uploadImage(image);
      await Utils.hideLoader();
      if (response.status == false) {
        Utils.errorSnackBar(response.message);
      } else {
        if (response.data != null) {
          Fluttertoast.showToast(
              msg:"Upload Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.black,
              fontSize: 16.0);
        }
      }
    }
  }
}
