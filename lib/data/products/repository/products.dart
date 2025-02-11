import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/products/models/get_product_py_category_req.dart';
import 'package:flutter_application_1/data/products/models/paying_information_model.dart';
import 'package:flutter_application_1/data/products/models/product_model.dart';
import 'package:flutter_application_1/data/products/src/products_cache_services.dart';
import '../models/rating_information_model.dart';
import '../src/products_api_services.dart';
import '../../../domain/product/entity/product_entity.dart';
import '../../../domain/product/repository/products.dart';
import '../../../servise_locator.dart';

class ProductsRepositoryImp extends ProductsRepository {
  final globalexpiryDate = const Duration(seconds: 10);

  final List<ProductModel> _popularProducts = [
    ProductModel(
      isAvaliable: true,
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
      category: "",
      subCategory: "",
    ),
    ProductModel(
      isAvaliable: true,
      bookmark: true,
      id: "2",
      images: ["https://i.imgur.com/q9oF9Yq.png"],
      title: "Mountain Beta Warehouse",
      brandName: "Lipsy london",
      price: 800,
      category: "",
      subCategory: "",
    ),
    ProductModel(
      isAvaliable: true,
      bookmark: true,
      id: "3",
      images: ["https://i.imgur.com/MsppAcx.png"],
      title: "FS - Nike Air Max 270 Really React",
      brandName: "Lipsy london",
      price: 650.62,
      priceAfetDiscount: 390.36,
      dicountpercent: 40,
      category: "",
      subCategory: "",
    ),
    ProductModel(
      isAvaliable: false,
      bookmark: true,
      id: "4",
      images: ["https://i.imgur.com/JfyZlnO.png"],
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 1264,
      priceAfetDiscount: 1200.8,
      dicountpercent: 5,
      category: "",
      subCategory: "",
    ),
    ProductModel(
      isAvaliable: false,
      bookmark: true,
      id: "5",
      images: ["https://i.imgur.com/tXyOMMG.png"],
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 650.62,
      priceAfetDiscount: 390.36,
      dicountpercent: 40,
      category: "",
      subCategory: "",
    ),
    ProductModel(
      isAvaliable: true,
      bookmark: false,
      id: "6",
      images: ["https://i.imgur.com/h2LqppX.png"],
      title: "white satin corset top",
      brandName: "Lipsy london",
      price: 1264,
      priceAfetDiscount: 1200.8,
      dicountpercent: 5,
      category: "",
      subCategory: "",
    ),
  ];

  final List<ProductModel> _topSellingProducts = [
    ProductModel(
      isAvaliable: false,
      bookmark: true,
      id: "5",
      images: ["https://i.imgur.com/tXyOMMG.png"],
      title: "Green Poplin Ruched Front",
      brandName: "Lipsy london",
      price: 650.62,
      priceAfetDiscount: 390.36,
      dicountpercent: 40,
      category: "",
      subCategory: "",
    ),
    ProductModel(
      isAvaliable: true,
      bookmark: false,
      id: "6",
      images: ["https://i.imgur.com/h2LqppX.png"],
      title: "white satin corset top",
      brandName: "Lipsy london",
      price: 1264,
      priceAfetDiscount: 1200.8,
      dicountpercent: 5,
      category: "",
      subCategory: "",
    ),
    ProductModel(
      isAvaliable: false,
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
      category: "",
      subCategory: "",
    ),
    ProductModel(
      isAvaliable: true,
      bookmark: true,
      id: "2",
      images: ["https://i.imgur.com/q9oF9Yq.png"],
      title: "Mountain Beta Warehouse",
      brandName: "Lipsy london",
      price: 800,
      category: "",
      subCategory: "",
    ),
  ];


  final fakeRatingInformationModel = RatingInformationModel(
      id: "1",
      rating: 4.3,
      numOfOneStar: 12,
      numOfTwoStar: 13,
      numOfThreeStar: 49,
      numOfFourStar: 100,
      numOfFiveStar: 120,
      numOfReviews: 300,
      description:
          "A cool gray cap in soft corduroy. Watch me.' By buying cotton products from Lindex, you’re supporting more responsibly...",
    );

  final fakePayingInformationModel = PayingInformationModel(
      id: "1",
      colors: [Colors.black,Colors.red,Colors.yellowAccent],
      sizes: ["X","XL","XLL"]
    );

  @override
  Future<Either> getFlashSaleProducts(int page) async {
    return getIt.call<ProductsApiServices>().getFlashSaleProducts();
  }

  @override
  Future<Either> getPopularProducts(int page) async {
    final popularProducts = _popularProducts;
    getIt.call<ProductsCacheServices>().cachePopularProduct(popularProducts,page);
    return Right(popularProducts.map((model)=>model.toEntity()).toList());
  }

  @override
  Future<Either> getFamiliarProduct(String id) async {
    await Future.delayed(const Duration(seconds: 5));

    //for test
    return Right([
      ProductEntity(
        isAvaliable: true,
        id: "4",
        images: ["https://i.imgur.com/JfyZlnO.png"],
        title: "Green Poplin Ruched Front",
        brandName: "Lipsy london",
        price: 1264,
        priceAfetDiscount: 1200.8,
        dicountpercent: 5,
        bookmark: false,
        category: "",
        subCategory: "",
      ),
      ProductEntity(
        isAvaliable: true,
        id: "5",
        images: ["https://i.imgur.com/tXyOMMG.png"],
        title: "Green Poplin Ruched Front",
        brandName: "Lipsy london",
        price: 650.62,
        priceAfetDiscount: 390.36,
        dicountpercent: 40,
        bookmark: true,
        category: "",
        subCategory: "",
      ),
      ProductEntity(
        isAvaliable: false,
        id: "6",
        images: ["https://i.imgur.com/h2LqppX.png"],
        title: "white satin corset top",
        brandName: "Lipsy london",
        price: 1264,
        priceAfetDiscount: 1200.8,
        dicountpercent: 5,
        bookmark: false,
        category: "",
        subCategory: "",
      ),
    ]);
  }

  @override
  Future<Either> getProductRatingInformation(String id) async {
    await Future.delayed(const Duration(seconds: 5));
    final ratingInformation = fakeRatingInformationModel;
    await getIt.call<ProductsCacheServices>().cacheProductRatingInformation(ratingInformation);
    return Right(ratingInformation.toEntity());

  }

  @override
  Future<Either> getProductsPyCategory(GetProductPyCategoryReq category) {
    return getIt.call<ProductsApiServices>().getProductsPyCategory(category);
  }

  @override
  Future<Either> getTopSellingProducts(int page) async {
    final topSellingProduct = _topSellingProducts; // for test (http)
    await getIt.call<ProductsCacheServices>().cacheTopSellingProduct(topSellingProduct,page);
    return Right(topSellingProduct.map((model)=>model.toEntity()).toList());
  }

  @override
  Future<Either> addProductToBookmark(String id) async {
    Either response =
        await getIt.call<ProductsApiServices>().addProductToBookmark(id);
    // here must refrech the cash if Right
    return response;
  }

  @override
  Future<Either> removeProductFromBookmark(String id) async {
    await Future.delayed(const Duration(seconds: 5));
    Either response =
        await getIt.call<ProductsApiServices>().removeProductFromBookmark(id);
    // here must refrech the cash if Right
    return response;
  }


  @override
  Future<Either> getBookmarkedProducts() async {
    await Future.delayed(const Duration(seconds: 5));
    return Right([
      ProductEntity(
        isAvaliable: true,
        bookmark: true,
        id: "2",
        images: ["https://i.imgur.com/q9oF9Yq.png"],
        title: "Mountain Beta Warehouse",
        brandName: "Lipsy london",
        price: 800,
        category: "",
        subCategory: "",
      ),
      ProductEntity(
        isAvaliable: false,
        bookmark: true,
        id: "3",
        images: ["https://i.imgur.com/MsppAcx.png"],
        title: "FS - Nike Air Max 270 Really React",
        brandName: "Lipsy london",
        price: 650.62,
        priceAfetDiscount: 390.36,
        dicountpercent: 40,
              category: "",
      subCategory: "",
      ),
      ProductEntity(
        isAvaliable: true,
        bookmark: true,
        id: "4",
        images: ["https://i.imgur.com/JfyZlnO.png"],
        title: "Green Poplin Ruched Front",
        brandName: "Lipsy london",
        price: 1264,
        priceAfetDiscount: 1200.8,
        dicountpercent: 5,
        category: "",
        subCategory: "",
      ),
    ]);
  }
  
  @override
  Future<Either> getProductPyingInformation(String id) async{
    await Future.delayed(const Duration(seconds: 2));
    final data = fakePayingInformationModel;  // here i must get the data from the server but this is for tesing
    await getIt.call<ProductsCacheServices>().cacheProductPayingInformation(data);
    return Right(data.toEntity());
  }
  
  @override
  Future<Either> getCacheFlashSaleProducts(int page) {
    // TODO: implement getCacheFlashSaleProducts not exist in cach
    throw UnimplementedError();
  }
  
  @override
  Future<Either> getCachePopularProducts(int page) async{
   final cachedPopularProduct = getIt.call<ProductsCacheServices>().getPopularProduct(page);
    if(cachedPopularProduct.isEmpty){
      return const Left([]);
    }
    final cachedPopularProductTimestamp = getIt.call<ProductsCacheServices>().getTimeStampOfPopularProduct(page);
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedPopularProductTimestamp!, globalexpiryDate);

    if(isValidTime){
      return Right(cachedPopularProduct.map((model)=>model.toEntity()));
    }else{
      return Left(cachedPopularProduct.map((model)=>model.toEntity()));
    }
  }
  
  @override
  Future<Either> getCacheProductPyingInformation(String id) async{
    final cachedProductPayingInformation = getIt.call<ProductsCacheServices>().getProductPayingInformation(id);
    if(cachedProductPayingInformation == null){
      return const Left(null);
    }
    final cachedProductPyingInformationTimestamp = getIt.call<ProductsCacheServices>().getTimeStampOfPayingInformation(id);
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedProductPyingInformationTimestamp!, globalexpiryDate);

    if(isValidTime){
      return Right(cachedProductPayingInformation.toEntity());
    }else{
      return Left(cachedProductPayingInformation.toEntity());
    }
  }
  
  @override
  Future<Either> getCacheProductRatingInformation(String id) async{
    final cachedProductRatingInformation = getIt.call<ProductsCacheServices>().getProductRatingInformation(id);
    if(cachedProductRatingInformation == null){
      return const Left(null);
    }
    final cachedProductRatingInformationTimestamp = getIt.call<ProductsCacheServices>().getTimeStampOfRatingInformation(id);
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedProductRatingInformationTimestamp!, globalexpiryDate);
    print("is valid${isValidTime}");
    if(isValidTime){
      return Right(cachedProductRatingInformation.toEntity());
    }else{
      return Left(cachedProductRatingInformation.toEntity());
    }
  }
  
  @override
  Future<Either> getCacheTopSellingProducts(int page) async{
    final cachedTopSellingProduct = getIt.call<ProductsCacheServices>().getTopSellingProduct(page);
    if(cachedTopSellingProduct.isEmpty){
      return const Left([]);
    }
    final cachedTopSellingProductTimestamp = getIt.call<ProductsCacheServices>().getTimeStampOfTopSellingProduct(page);
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedTopSellingProductTimestamp!, globalexpiryDate);

    if(isValidTime){
      return Right(cachedTopSellingProduct.map((model)=>model.toEntity()));
    }else{
      return Left(cachedTopSellingProduct.map((model)=>model.toEntity()));
    }
}
}