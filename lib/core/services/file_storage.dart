import 'dart:io';
import 'package:path/path.dart' as b;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flower_up_product/core/services/storage_service.dart';


class FireStorage implements StorageSerivce {
  final storageReferance = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file , String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var fileReference =
    storageReferance.child('$path/$fileName.$extensionName');

    await fileReference.putFile(file);
    var fileUrl = await fileReference.getDownloadURL();

    return fileUrl;
  }
}

// class FireStorage implements StorageSerivce {
//   final storageReferance = FirebaseStorage.instance.ref();
//
//   @override
//   Future<String> uploadFile(File file , String path) async {
//     String fileName = b.basename(file.path);
//     String extensionName = b.extension(file.path);
//     var fileReference =
//          storageReferance.child('$path/$fileName.$extensionName');
//     await fileReference.putFile(file);
//     var fileUrl = fileReference.getDownloadURL();
//     return fileUrl;
//        }
// }