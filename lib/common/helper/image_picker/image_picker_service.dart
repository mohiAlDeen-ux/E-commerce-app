import "dart:io";
import "package:image_picker/image_picker.dart";
import 'package:dartz/dartz.dart';

class MyImagePicker {
  static Future<Either<String,File>> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      return Right(File(pickedFile.path));
    } else {
      return const Left('No image selected.');
    }
  }

  static Future<Either<String,File>> pickImageFromCamera()async{
    return await pickImage(ImageSource.camera);
  }

  static Future<Either<String,File>> pickImageFromGallery()async{
    return await pickImage(ImageSource.gallery);
  }

}
