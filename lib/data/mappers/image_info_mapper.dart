import '../../domain/entity/image_info.dart';
import '../dto/image_info_dto.dart';
import '../models/image_info_model.dart';

class ImageInfoMapper {
  static ImageInfo fromDto(ImageInfoDto dto) {
    return ImageInfo(id: dto.id!, url: dto.url!, userId: dto.userId!);
    // DTO -> 엔티티
  }

  static ImageInfoDto toCreateDto(ImageInfo entity) {
    return ImageInfoDto.create(
      url: entity.url,
      userId: entity.userId,
    );
    // 엔티티 -> DTO
  }

  static ImageInfoDto toDeleteDto(ImageInfo entity) {
    return ImageInfoDto.delete(
      id: entity.id,
      userId: entity.userId,
    );
    // 엔티티 -> DTO
  }

  static ImageInfoModel toModel(ImageInfo entity) {
    return ImageInfoModel(
      id: entity.id,
      url: entity.url,
      userId: entity.userId,
    );
    // 엔티티 -> 모델
  }

  static ImageInfo toEntity(ImageInfoModel model) {
    return ImageInfo(id: model.id, url: model.url, userId: model.userId);
    // 모델 -> 엔티티
  }
}
