import 'dart:typed_data';

import 'package:imageViewer/data/dto/image_info_dto.dart';
import 'package:imageViewer/data/mappers/image_info_mapper.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/data_source_impl/remote_data_source_impl.dart';
import '../../data/repository/image_info_repository.dart';
import '../entity/image_info.dart';

class ManageImageInfoUseCase {
  final ImageInfoRepository _imageInfoRepository;

  ManageImageInfoUseCase(this._imageInfoRepository);

  Future<void> uploadImage(String userId) async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    Uint8List bytes = await file.readAsBytes();
    String path = await RemoteDataSourceImpl().uploadFile(bytes);
    await _imageInfoRepository
        .createImageInfo(ImageInfoDto.create(url: path, userId: userId));
  }

  Future<void> deleteImageInfo(ImageInfo imageInfo) async {
    await _imageInfoRepository
        .deleteImageInfo(ImageInfoMapper.toDeleteDto(imageInfo));
  }

  Future<List<ImageInfo>> getImageInfoList(String userId) async {
    List<ImageInfoDto> ret =
        await _imageInfoRepository.getImageInfoList(userId);
    return ret.map((e) => ImageInfoMapper.fromDto(e)).toList();
  }
}
