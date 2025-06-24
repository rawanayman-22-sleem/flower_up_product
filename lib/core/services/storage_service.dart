import 'dart:io';

abstract class StorageSerivce {

  Future<String> uploadFile(File file , String path) ;
}