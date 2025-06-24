import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';


import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImagrFeild extends StatefulWidget {
  const ImagrFeild({super.key, required this.onFileChange});

  final ValueChanged<File?> onFileChange;

  @override
  State<ImagrFeild> createState() => _ImagrFeildState();
}

class _ImagrFeildState extends State<ImagrFeild> {
  bool isLoading = false;
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await showModalBottomSheet<XFile?>(
        context: context,
        builder: (context) => SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from the gallery'),
                onTap: () async {
                  final picker = ImagePicker();
                  final image = await picker.pickImage(source: ImageSource.gallery);
                  Navigator.of(context).pop(image);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a picture with the camera'),
                onTap: () async {
                  final picker = ImagePicker();
                  final photo = await picker.pickImage(source: ImageSource.camera);
                  Navigator.of(context).pop(photo);
                },
              ),
            ],
          ),
        ),
      );

      if (result != null) {
        setState(() {
          _selectedImage = result;
        });
      }
    } catch (e) {
      print('حدث خطأ أثناء اختيار الصورة: $e');
    } finally {
      setState(() {
        isLoading = false;
      });

        widget.onFileChange(File(_selectedImage!.path));


    }
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: _pickImage,
        child: Stack(
          children:[
            Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : _selectedImage != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(_selectedImage!.path),
                 // height: 160,
                  fit: BoxFit.cover,
                ),
              )
                  : Icon(
                Icons.image_outlined,
                size: 160,
                color: Colors.grey[600],
              ),
            ),
          ),
            
            Visibility(
              visible: _selectedImage != null,
              child: IconButton(
                onPressed: () {
                  final image = _selectedImage;
                  if (image != null) {
                    widget.onFileChange(File(image.path));
                    setState(() {
                      _selectedImage = null;
                    });
                  }
                },
                  icon: Icon(
                      Icons.close_outlined,
                  color: Colors.red,
                  size: 44,),
              ),
            )
        ]
        ),
      ),
    );
  }
}

// class ImagrFeild extends StatefulWidget {
//   const ImagrFeild({super.key});
//
//   @override
//   State<ImagrFeild> createState() => _ImagrFeildState();
// }
//
// class _ImagrFeildState extends State<ImagrFeild> {
//
//   bool isLoading = false;
//   XFile? _selectedImage;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       enabled: isLoading,
//       child: GestureDetector(
//         onTap: () async {
//           setState(() {
//             isLoading = true;
//           });
//
//        await showModalBottomSheet(
//     context: context,
//     builder: (context) =>
//         SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 leading: Icon(Icons.photo_library),
//                 title: Text('Choose from the gallery'),
//                 onTap: () async {
//                   Navigator.of(context).pop();
//                   final ImagePicker picker = ImagePicker();
//                   final XFile? image = await picker.pickImage(
//                       source: ImageSource.gallery);
//                   if (image != null) {
//                     print(
//                         'A photo was selected from the gallery: ${image.path}');
//                   }
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.camera_alt),
//                 title: Text('Take a picture with the camera'),
//                 onTap: () async {
//                   Navigator.of(context).pop();
//                   final ImagePicker picker = ImagePicker();
//                   final XFile? photo = await picker.pickImage(
//                       source: ImageSource.camera);
//                   if (photo != null) {
//                     print('A photo was taken with the camera: ${photo.path}');
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//   );
//
//
//           setState(() {
//             isLoading = false;
//           });
//         },
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.grey[100],
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.grey.shade300),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 8,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Center(
//             child: Icon(
//               Icons.image_outlined,
//               size: 160,
//               color: Colors.grey[600],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
