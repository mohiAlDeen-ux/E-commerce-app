import 'dart:io';

abstract class ImageState{}

class ExistImage extends ImageState{
  File image;
  ExistImage(this.image);
}

class NotExistImage extends ImageState {}