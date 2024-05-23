import '../../core/interfaces/brand_data.dart';

class BrandInfo implements BrandData {
  String _name;
  String _brandCode;
  @override
  final String id;

  BrandInfo({
    required String name,
    required String brandCode,
    required this.id,
  })  : _name = name,
        _brandCode = brandCode;

  @override
  String get name => _name;

  @override
  String get brandCode => _brandCode;

  @override
  bool get isValid => _name.isNotEmpty && _brandCode.isNotEmpty;

  @override
  void updateName(String newName) {
    _name = newName;
  }

  @override
  void updateBrandCode(String newBrandCode) {
    _brandCode = newBrandCode;
  }

}
