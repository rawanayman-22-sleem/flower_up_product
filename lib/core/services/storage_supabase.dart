import 'dart:io';
import 'package:flower_up_product/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../widgets/constants.dart';
import 'package:path/path.dart' as b;

// class StorageSupabase  implements StorageSerivce{
//
//   static createBuckets(String bucketName) async {
//     var buckets = await _supabase.client.storage.listBuckets();
//     bool isBucketExite = false;
//     for (var bucket in buckets) {
//       if(bucket.id == bucketName) {
//         isBucketExite = true;
//         break;
//       }
//     }
//     if (!isBucketExite) {
//       await _supabase.client.storage.createBucket(bucketName);
//     }
//   }
//
//   //149
//
//   static late Supabase _supabase;
//   static initSupabase() async {
//     _supabase = await Supabase.initialize(
//       url: UrlSupabase,
//       anonKey: KEYSupabaseSecrit,
//     );
//   }
//
// @override
//     Future<String> uploadFile(File file , String path) async {
//       String fileName = b.basename(file.path);
//       String extensionName = b.extension(file.path);
//      var result = await _supabase.client.storage
//          .from('flowers_images')
//          .upload('$path/$fileName.$extensionName', file);
//
//      return result;
//     }
//   }


