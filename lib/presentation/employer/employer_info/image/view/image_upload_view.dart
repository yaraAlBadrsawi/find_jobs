// import 'package:flutter/cupertino.dart';
//
// class ImageUploads extends StatelessWidget {
//
//
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//
//   File? _photo;
//   final ImagePicker _picker = ImagePicker();
//
//   Future imgFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future imgFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//
//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future uploadFile() async {
//     if (_photo == null) return;
//     final fileName = basename(_photo!.path);
//     final destination = 'files/$fileName';
//
//     try {
//       final ref = firebase_storage.FirebaseStorage.instance
//           .ref(destination)
//           .child('file/');
//       await ref.putFile(_photo!);
//     } catch (e) {
//       print('error occured');
//     }
//   }