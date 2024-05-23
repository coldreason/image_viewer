abstract class BrandData {
  String get name;
  String get brandCode;
  String get id;

  bool get isValid; // 브랜드 정보의 유효성 여부

  void updateName(String newName); // 브랜드 이름 변경
  void updateBrandCode(String newBrandCode); // 브랜드 코드 변경s
}