import '../../core/interfaces/image_data.dart';

class ImageInfo implements ImageData {
  String _url;
  final String _id;
  final String _userId;

  ImageInfo({
    required String id,
    required String url,
    required String userId,
  })  : _url = url,
        _id = id,
        _userId = userId;

  @override
  String get url => _url;

  @override
  String get id => _id;

  @override
  String get userId => _userId;

  @override
  bool get isValid => _id.isNotEmpty && _url.isNotEmpty && _userId.isNotEmpty;

  @override
  void updateUrl(String newUrl) {
    _url = newUrl;
  }
}
