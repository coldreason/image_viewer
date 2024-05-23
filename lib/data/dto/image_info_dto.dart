import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_info_dto.freezed.dart';

part 'image_info_dto.g.dart';

@freezed
class ImageInfoDto with _$ImageInfoDto {
  const factory ImageInfoDto({
    String? id,
    String? url,
    String? userId
  }) = _ImageInfoDto;

  factory ImageInfoDto.create({
    required String url,
    required String userId,
  }) =>
      ImageInfoDto(
          url: url,
          userId: userId

      );

  factory ImageInfoDto.delete({
    required String id,
    required String userId,
  }) =>
      ImageInfoDto(
          id: id,
          userId: userId
      );

  factory ImageInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoDtoFromJson(json);
}