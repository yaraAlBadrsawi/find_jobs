import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/widget/loading.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FireBaseStorage {
  Future<String> uploadImageToFirebase(XFile? imageFile) async {
    String imageUrl = '';

    //Get a reference to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('profile_images');

    //Create a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImages
        .child('images/${DateTime.now().millisecondsSinceEpoch}');

    //Handle errors/success
    try {
      //Store the file
      await referenceImageToUpload.putFile(File(imageFile!.path));
      //Success: get the download URL
      imageUrl = await referenceImageToUpload.getDownloadURL();

        // Get.snackbar(imageUrl.isNotEmpty ? 'image upload done ': 'error occur' , '');
      return imageUrl;
    } catch (error) {
      //Some error occurred
      // Get.snackbar('error $error', '');

      return '$error';
    }

    // // Reference to Firebase Storage bucket
    // Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
    //
    // // Upload the image to Firebase Storage
    // UploadTask uploadTask = storageReference.putFile(imageFile);
    // TaskSnapshot taskSnapshot = await uploadTask;
    //
    // // Get the download URL of the uploaded image
    // String downloadURL = await taskSnapshot.ref.getDownloadURL();
    //
    // print('Image uploaded. Download URL: $downloadURL');
  }
}
