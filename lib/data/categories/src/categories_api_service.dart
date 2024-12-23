import 'dart:convert';

import 'package:flutter_application_1/core/constant/urls_constant.dart';
import 'package:flutter_application_1/data/categories/models/categories_models.dart';
import "package:http/http.dart" as http;
import "package:dartz/dartz.dart";

abstract class CategoriesApiService{
  Future<Either<String,List<CategoryModels>>>  getCategories();
}

class CategoriesApiServiceImp extends CategoriesApiService{

  @override
  Future<Either<String,List<CategoryModels>>> getCategories()async {

    final url = Uri.parse(UrlsConstant.getCategories);

    try{
      final http.Response response = await http.get(url);
      List<dynamic> body = jsonDecode(response.body);
      return Right(body.map((item) => CategoryModels.fromMap(item)).toList());

    }catch(error){
      return const Left("network error");
    }
  }
}