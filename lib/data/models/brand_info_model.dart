import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_info_model.freezed.dart';
part 'brand_info_model.g.dart';

@freezed
class BrandInfoModel with _$BrandInfoModel {
  const BrandInfoModel._();

  const factory BrandInfoModel({
    required String name,
    required String brandCode,
    required String id,
  }) = _BrandInfoModel;

  factory BrandInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BrandInfoModelFromJson(json);
}
