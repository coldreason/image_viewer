import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_info_model.freezed.dart';
part 'image_info_model.g.dart';

@freezed
class ImageInfoModel with _$ImageInfoModel {
  const ImageInfoModel._();

  const factory ImageInfoModel({
    required String id,
    required String url,
    required String userId,
  }) = _ImageInfoModel;

  factory ImageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoModelFromJson(json);
}
