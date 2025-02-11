// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:flutter_application_1/domain/product/entity/paying_information_entity.dart';

class PayingInformationModel {
  String id;
  List<Color> colors;
  List<String> sizes;

  PayingInformationModel({
    required this.id,
    required this.colors,
    required this.sizes
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      'colors': colors.map((x) => x.value.toString()).toList(),
      'sizes': sizes,
    };
  }

  factory PayingInformationModel.fromMap(Map<String, dynamic> map) {
    return PayingInformationModel(
      id: map['id'],
      colors: List<Color>.from((map['colors'] as List<dynamic>).map<Color>((x) => Color(int.parse(x)),),),
      sizes: List<String>.from((map['sizes'] as List<dynamic>),)
    );
  }

  String toJson() => json.encode(toMap());

  factory PayingInformationModel.fromJson(String source) => PayingInformationModel.fromMap(json.decode(source) as Map<String, dynamic>);


}

extension PayingInformaitonXModel on PayingInformationModel{
    PayingInformationEntity toEntity(){
    return PayingInformationEntity(
      id: id,
      colors: colors,
      sizes: sizes
      );
  }
}
