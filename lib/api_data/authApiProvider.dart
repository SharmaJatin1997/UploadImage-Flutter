import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_upload/api_data/Injector.dart';
import 'package:image_upload/api_data/UserModel.dart';
import 'package:image_upload/api_data/data_response.dart';
import 'package:image_upload/api_data/page_response.dart';
import 'package:image_upload/utils.dart';

class AuthApiProvider {
  late Dio _dio;

  AuthApiProvider() {
    _dio = Injector().getDio();
  }

  Future<PageResponse<UserModel?>> uploadImage(String imagePath) async {
    Map<String, dynamic> map = {};
    if (imagePath.isNotEmpty && !imagePath.contains("http")) {
      File file = File(imagePath);
      String fileType = imagePath.substring(imagePath.lastIndexOf(".") + 1);
      map['image'] = await MultipartFile.fromFile(file.path,
          filename: imagePath.split("/").last,
          contentType: MediaType(Utils.getFileType(imagePath)!, fileType));
    }
    try {
      Response response = await _dio.post(
          "http://65.2.68.95:8020/api/file_upload",
          data: FormData.fromMap(map));
      var dataResponse = PageResponse<UserModel>.fromJson(response.data,
          (data) => UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    } catch (error) {
      final res = (error as dynamic).response;
      if (res != null) return PageResponse.fromJson(res?.data, (data) => null);
      return PageResponse(statusCode: 0, message: error.toString());
    }
  }
}
