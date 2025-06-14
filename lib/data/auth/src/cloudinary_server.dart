import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class CloudinaryService {
  Future<Either<Failure, String>> uploadProfileImage(File image);
}

class CloudinaryServiceImp extends CloudinaryService {
  late final String _cloudName;
  late final String _uploadPreset;
  late final Cloudinary _cloudinary;

  CloudinaryServiceImp() {
    _initialize();
  }

  void _initialize() {
    try {
      _cloudName = dotenv.env['CLOUD_NAME']!;
      _uploadPreset = dotenv.env['UPLOAD_PRESET']!;
    } catch (e) {
      throw const CloudinaryConfigFailure();
    }
    
    _cloudinary = Cloudinary.unsignedConfig(
      cloudName: _cloudName,
    );
  }

  @override
  Future<Either<Failure, String>> uploadProfileImage(File image) async {
    try {
      if (!await image.exists()) {
        return const Left(CloudinaryUploadFailure());
      }

      final response = await _cloudinary.unsignedUpload(
        file: image.path,
        uploadPreset: _uploadPreset,
        resourceType: CloudinaryResourceType.image,
        folder: 'profile_images',
      );

      if (response.isSuccessful && response.secureUrl != null) {
        return Right(response.secureUrl!);
      } else {
        return const Left(CloudinaryUploadFailure());
      }
    } on CloudinaryConfigFailure {
      return const Left(CloudinaryConfigFailure());
    } on SocketException {
      return const Left(CloudinaryFailure('Network unavailable'));
    } catch (e) {
      return Left(CloudinaryFailure('Cloudinary error: ${e.toString()}'));
    }
  }
}