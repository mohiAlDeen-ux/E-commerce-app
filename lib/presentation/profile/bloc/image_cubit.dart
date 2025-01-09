import 'dart:io';

import 'image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCubit extends Cubit<ImageState>{
  ImageCubit():super(NotExistImage());
  
  void selecteImage(File image){
    emit(ExistImage(image));
  }
}