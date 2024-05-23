import '../data_source/remote_data_source.dart';
import '../dto/image_info_dto.dart';

class ImageInfoRepository{
  final RemoteDataSource remoteDataSource;

  ImageInfoRepository({required this.remoteDataSource});

  Future<ImageInfoDto> createImageInfo(ImageInfoDto imageInfo) async {
    return remoteDataSource.createImageInfo(imageInfo);
  }

  Future<void> deleteImageInfo(ImageInfoDto imageInfo) async {
    return remoteDataSource.deleteImageInfo(imageInfo);
  }

  Future<List<ImageInfoDto>> getImageInfoList(String userId) async {
    return remoteDataSource.getImageInfoList(userId);
  }

}