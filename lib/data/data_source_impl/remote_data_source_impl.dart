import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../data_source/remote_data_source.dart';
import '../dto/image_info_dto.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void init() async {
    prefs = await SharedPreferences.getInstance();
  }



  @override
  Future<void> deleteImageInfo(ImageInfoDto imageInfo) async {
    await db
        .collection('user')
        .doc(imageInfo.userId)
        .collection('imageInfo')
        .doc(imageInfo.id)
        .delete();
  }

  @override
  Future<ImageInfoDto> createImageInfo(ImageInfoDto imageInfo) async {
    var ref = db
        .collection('user')
        .doc(imageInfo.userId)
        .collection('imageInfo')
        .doc();

    ref.set(imageInfo.copyWith(id: ref.id).toJson());

    return imageInfo.copyWith(id: ref.id);
  }

  @override
  Future<List<ImageInfoDto>> getImageInfoList(String userId) async {
    var snapshot =
        await db.collection('user').doc(userId).collection('imageInfo').get();

    return snapshot.docs.map((e) => ImageInfoDto.fromJson(e.data())).toList();
  }

  @override
  Future<String> uploadFile(Uint8List bytes) async {
    Reference ref = FirebaseStorage.instance.ref().child(const Uuid().v4());

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
    );

    TaskSnapshot ret = await ref.putData(bytes, metadata);
    return ret.ref.getDownloadURL();
  }
}
