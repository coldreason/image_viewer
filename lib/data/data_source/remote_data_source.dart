import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

import '../dto/image_info_dto.dart';

abstract class RemoteDataSource {
  late SharedPreferences prefs;

  void init();

  Future<ImageInfoDto> createImageInfo(ImageInfoDto imageInfo);

  Future<void> deleteImageInfo(ImageInfoDto imageInfo);

  Future<List<ImageInfoDto>> getImageInfoList(String userId);

  Future<String> uploadFile(Uint8List bytes);
}
