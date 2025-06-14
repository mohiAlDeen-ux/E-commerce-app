import 'dart:convert';

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;

import '../../../core/constant/urls_constant.dart';
import '../models/categories_models.dart';

abstract class CategoriesApiService{
  Future<Either<String,List<CategoryModels>>>  getCategories();
  Future<Either<String, dynamic>> getFullCategories();

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
  
  @override
  Future<Either<String, dynamic>> getFullCategories() {
    throw UnimplementedError();
  }
}