abstract class ImageData {
  String get id;

  String get url;

  String get userId;

  bool get isValid; // 이미지 정보의 유효성 여부

  void updateUrl(String newUrl); // 이미지 URL 변경
}
