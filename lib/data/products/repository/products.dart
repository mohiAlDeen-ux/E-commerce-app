import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/data/products/models/full_product_model.dart';
import 'package:flutter_application_1/data/products/models/product_model.dart';
import 'package:flutter_application_1/data/products/src/products_api_services.dart';
import 'package:flutter_application_1/domain/product/entity/full_product_entity.dart';
import 'package:flutter_application_1/domain/product/entity/product_entity.dart';
import 'package:flutter_application_1/domain/product/repository/products.dart';
import 'package:flutter_application_1/servise_locator.dart';

class ProductsRepositoryImp extends ProductsRepository {
  late List<ProductEntity> _popularProducts = [
    ProductEntity(
      bookmark: false,
      id: "1",
      images: [
        "https://i.imgur.com/CGCyp1d.png",
        "https://i.imgur.com/AkzWQuJ.png",
        "https://i.imgur.com/J7mGZ12.png"
      ],
      title: "Mountain Warehouse for Women",
      brandName: "Lipsy london",
      price: 540,
      priceAfetDiscount: 420,
      dicountpercent: 20,
    ),
    ProductEntity(
      bookmark: true,
      id: "2",
      images: ["https://i.imgur.com/q9oF9Yq.png"],
      title: "Mountain Beta Warehouse",
      brandName: "Lipsy london",
      price: 800,
    ),
    ProductEntity(
      bookmark: true,
      id: "3",
      images: ["https://i.imgur.com/MsppAcx.png"],
      title: "FS - Nike Air Max 270 Really React",
      brandName: "Lipsy london",
      price: 650.62,
      priceAfetDiscount: 390.36,
      dicountpercent: 40,
    ),
    ProductEntity(
      bookmark: true,
      id: "4",
      images: ["https://i.imgur.com/JfyZlnO.png"],
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 1264,
      priceAfetDiscount: 1200.8,
      dicountpercent: 5,
    ),
    ProductEntity(
      bookmark: true,
      id: "5",
      images: ["https://i.imgur.com/tXyOMMG.png"],
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 650.62,
      priceAfetDiscount: 390.36,
      dicountpercent: 40,
    ),
    ProductEntity(
      bookmark: false,
      id: "6",
      images: ["https://i.imgur.com/h2LqppX.png"],
      title: "white satin corset top",
      brandName: "Lipsy london",
      price: 1264,
      priceAfetDiscount: 1200.8,
      dicountpercent: 5,
    ),
  ];

  late List<ProductEntity> _topSellingProducts = [];

  final Map<String, FullProductEntity> _producDetail = {
    "1": FullProductEntity(
      rating: 4.3,
      numOfOneStar: 12,
      numOfTwoStar: 13,
      numOfThreeStar: 49,
      numOfFourStar: 100,
      numOfFiveStar: 120,
      numOfReviews: 200,
      description:
          "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    )
  };

  @override
  Future<Either> getFlashSaleProducts() async {
    return getIt.call<ProductsApiServices>().getFlashSaleProducts();
  }

  @override
  Future<Either> getPopularProducts() async {
    if (_popularProducts.isEmpty) {
      return (await getIt.call<ProductsApiServices>().getPopularProducts())
          .fold((error) {
        return Left(error);
      }, (products) {
        _popularProducts =
            products.map((element) => element.toEntity()).toList();
        return Right(_popularProducts);
      });
    }

    return Right(_popularProducts);
  }

  @override
  Future<Either> getFamiliarProduct(String id) async {
    await Future.delayed(Duration(seconds: 5));

    //for test
    return Right([
      ProductEntity(
        id: "4",
        images: ["https://i.imgur.com/JfyZlnO.png"],
        title: "Green Poplin Ruched Front",
        brandName: "Lipsy london",
        price: 1264,
        priceAfetDiscount: 1200.8,
        dicountpercent: 5,
        bookmark: false,
      ),
      ProductEntity(
        id: "5",
        images: ["https://i.imgur.com/tXyOMMG.png"],
        title: "Green Poplin Ruched Front",
        brandName: "Lipsy london",
        price: 650.62,
        priceAfetDiscount: 390.36,
        dicountpercent: 40,
        bookmark: true,
      ),
      ProductEntity(
        id: "6",
        images: ["https://i.imgur.com/h2LqppX.png"],
        title: "white satin corset top",
        brandName: "Lipsy london",
        price: 1264,
        priceAfetDiscount: 1200.8,
        dicountpercent: 5,
        bookmark: false,
      ),
    ]);
  }

  @override
  Future<Either> getProductPyId(String id) async {
    //for testing
    await Future.delayed(const Duration(seconds: 5));
    return Right(_producDetail["1"]) ;

    if (_producDetail.containsKey(id)) {
      return Right(_producDetail[id]);
    }

    final product = await getIt.call<ProductsApiServices>().getProductPyId(id);
    return product.fold((error) {
      return Left(error);
    }, (returndProduct) {
      _producDetail[id] = (returndProduct as FullProductModel).toEntity();
      return Right(_producDetail[id]);
    });
  }

  @override
  Future<Either> getProductsPyCategory(String categoryId) {
    return getIt.call<ProductsApiServices>().getProductsPyCategory(categoryId);
  }

  @override
  Future<Either> getTopSellingProducts() {
    return getIt.call<ProductsApiServices>().getTopSelingProducts();
  }
  
  @override
  Future<Either> addProductToBookmark(String id) async{
    await Future.delayed(Duration(seconds: 5));
    Either response = await getIt.call<ProductsApiServices>().addProductToBookmark(id);
    // here must refrech the cash if Right
    return response;
  }
  
  @override
  Future<Either> removeProductFromBookmark(String id) async{
    await Future.delayed(Duration(seconds: 5));
    Either response = await getIt.call<ProductsApiServices>().removeProductFromBookmark(id);
    // here must refrech the cash if Right
    return response;

  }
  
  @override
  Future<Either> isAvaliable(String id) async{
    await Future.delayed(Duration(seconds: 5));
    return const Right(true);
  }
}
