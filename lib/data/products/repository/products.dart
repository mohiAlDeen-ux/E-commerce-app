import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/data/products/models/product_model.dart';
import 'package:flutter_application_1/data/products/src/products_api_services.dart';
import 'package:flutter_application_1/domain/product/entity/product_entity.dart';
import 'package:flutter_application_1/domain/product/repository/products.dart';
import 'package:flutter_application_1/servise_locator.dart';

class ProductsRepositoryImp extends ProductsRepository{
  late List<ProductEntity> _popularProducts = [
  ProductEntity(
    image: "https://i.imgur.com/CGCyp1d.png",
    title: "Mountain Warehouse for Women",
    brandName: "Lipsy london",
    price: 540,
    priceAfetDiscount: 420,
    dicountpercent: 20,
  ),
  ProductEntity(
    image: "https://i.imgur.com/q9oF9Yq.png",
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: 800,
  ),

  ProductEntity(
    image: "https://i.imgur.com/MsppAcx.png",
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Lipsy london",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductEntity(
    image: "https://i.imgur.com/JfyZlnO.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductEntity(
    image: "https://i.imgur.com/tXyOMMG.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductEntity(
    image: "https://i.imgur.com/h2LqppX.png",
    title: "white satin corset top",
    brandName: "Lipsy london",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
];




  @override
  Future<Either> getFlashSaleProducts() async{
    return getIt.call<ProductsApiServices>().getFlashSaleProducts();
  }

  @override
  Future<Either> getPopularProducts() async{
    if (_popularProducts.isEmpty){
      return (await getIt.call<ProductsApiServices>().getPopularProducts()).fold((error){
       return Left(error);
      }, (products){
        _popularProducts = products.map((element) => element.toEntity()).toList();
       return Right(_popularProducts);
      });
    }

    return Right(_popularProducts);
  
  }

  @override
  Future<Either> getProductPyId(String id) {
    return getIt.call<ProductsApiServices>().getProductPyId(id);
  }

  @override
  Future<Either> getProductsPyCategory(String categoryId) {
   return getIt.call<ProductsApiServices>().getProductsPyCategory(categoryId);
  }

  @override
  Future<Either> getTopSelingProducts() {
    return getIt.call<ProductsApiServices>().getTopSelingProducts();
  }

}