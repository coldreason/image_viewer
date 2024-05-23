import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:imageViewer/domain/use_case/manage_image_info_use_case.dart';

import '../../domain/entity/image_info.dart';

String userId = 'userId';

class ManageImageInfoViewModel with ChangeNotifier {
  final ManageImageInfoUseCase manageImageInfoUseCase;

  ManageImageInfoViewModel({required this.manageImageInfoUseCase}) {
    initialize();
  }

  void initialize() async {
    imageInfoList = await manageImageInfoUseCase.getImageInfoList(userId);
    notifyListeners();
  }

  List<ImageInfo> imageInfoList = [];

  Future<void> uploadImage() async {
    await manageImageInfoUseCase.uploadImage(userId);
    imageInfoList = await manageImageInfoUseCase.getImageInfoList(userId);
    notifyListeners();
  }

  Future<void> removeTaskAtIndex(int index) async {
    ImageInfo imageInfo = imageInfoList[index];
    imageInfoList = imageInfoList..removeAt(index);
    await manageImageInfoUseCase.deleteImageInfo(imageInfo);
    notifyListeners();
    return;
  }

  Future<void> downloadLink(int index) async {
    String link = imageInfoList[index].url;
    await Clipboard.setData(
      ClipboardData(
        text: link,
      ),
    );
  }
}
