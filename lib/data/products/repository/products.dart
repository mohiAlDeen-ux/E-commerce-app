import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/products/models/get_familiar_product_req.dart';
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
  final globalExpiryDate = const Duration(seconds: 10);
  final globalExpiryDateForDelete = const Duration(days: 2);

  bool forTast = true;

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

final List<ProductModel> _flashSellProducts = [

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
      brandName: "Lipsy london flash",
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

  final List<ProductModel> familiarProducs = [
      ProductModel(
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
      ProductModel(
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
      ProductModel(
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
  Future<Either> getFlashSellProducts(int page) async {
    //return getIt.call<ProductsApiServices>().getFlashSaleProducts();
    final flashSellProducts = _flashSellProducts;
    getIt.call<ProductsCacheServices>().cacheFlashSellProduct(flashSellProducts,page);
    return Right(flashSellProducts.map((model)=>model.toEntity()).toList());
  }

  @override
  Future<Either> getPopularProducts(int page) async {
    print("in page$page");
    if(page == 1){
          if(forTast){
              forTast = false;
              return const Left("error");
          }
    }
    if(page == 6){
      return const Left("error in page 6");
    }
    
    print("inserver");
    final popularProducts = _popularProducts;
    getIt.call<ProductsCacheServices>().cachePopularProduct(popularProducts,page);
    return Right(popularProducts.map((model)=>model.toEntity()).toList());
  }

  @override
  Future<Either> getFamiliarProduct(GetFamiliarProductReq getFamiliarProduct) async {
    await Future.delayed(const Duration(seconds: 2));
    final familiarProducts = familiarProducs.map((product) => product.toEntity());
    await getIt.call<ProductsCacheServices>().cacheFamiliarProduct(familiarProducs,getFamiliarProduct.page,getFamiliarProduct.productId);
    return Right(familiarProducts);
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
  Future<List<ProductEntity>> getCacheFlashSellProducts() async{
    final cachedFlashSellProduct = getIt.call<ProductsCacheServices>().getAllFlashSellProduct();
    if(cachedFlashSellProduct.isEmpty){
      return const [];
    }
    final cachedFlashSellProductTimestamp = getIt.call<ProductsCacheServices>().getTimeStampOfFlashSellProduct(1);
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedFlashSellProductTimestamp!, globalExpiryDateForDelete);

    if(isValidTime){
      return cachedFlashSellProduct.map((model)=>model.toEntity()).toList();
    }else{
      getIt.call<ProductsCacheServices>().clearFlashSellProduct();
      return const [];
    }
  }
  
  @override
  Future<List<ProductEntity>> getCachePopularProducts() async{
    final cachedPopularProduct = getIt.call<ProductsCacheServices>().getAllPopularProduct();
    if(cachedPopularProduct.isEmpty){
      return const [];
    }
    final cachedPopularProductTimestamp = getIt.call<ProductsCacheServices>().getTimeStampOfPopularProduct(1);
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedPopularProductTimestamp!, globalExpiryDateForDelete);

    if(isValidTime){
      return cachedPopularProduct.map((model)=>model.toEntity()).toList();
    }else{
      getIt.call<ProductsCacheServices>().clearPopularProduct();
      return const [];
    }
  }
  
  @override
  Future<Either> getCacheProductPyingInformation(String id) async{
    final cachedProductPayingInformation = getIt.call<ProductsCacheServices>().getProductPayingInformation(id);
    if(cachedProductPayingInformation == null){
      return const Left(null);
    }
    final cachedProductPyingInformationTimestamp = getIt.call<ProductsCacheServices>().getTimeStampOfPayingInformation(id);
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedProductPyingInformationTimestamp!, globalExpiryDate);

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
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedProductRatingInformationTimestamp!, globalExpiryDate);
    print("is valid${isValidTime}");
    if(isValidTime){
      return Right(cachedProductRatingInformation.toEntity());
    }else{
      return Left(cachedProductRatingInformation.toEntity());
    }
  }
  
  @override
  Future<List<ProductEntity>> getCacheTopSellingProducts() async{
    final cachedTopSellingProduct = getIt.call<ProductsCacheServices>().getAllTopSellingProduct();
    if(cachedTopSellingProduct.isEmpty){
      return const [];
    }
    final cachedTopSellingProductTimestamp = getIt.call<ProductsCacheServices>().getTimeStampOfTopSellingProduct(1);
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedTopSellingProductTimestamp!, globalExpiryDateForDelete);

    if(isValidTime){
      return cachedTopSellingProduct.map((model)=>model.toEntity()).toList();
    }else{
      getIt.call<ProductsCacheServices>().clearTopSellingProduct();
      return const [];
    }
}

  @override
  bool isHaveEnoughDataInCache() {
    return getIt.call<ProductsCacheServices>().isHaveEnoughData();
  }
  
  @override
  Future<List<ProductEntity>> getCacheFamiliarProducts(String productId) async{
    final cachedFamiliarProduct = getIt.call<ProductsCacheServices>().getAllFamiliarProduct(productId);
    if(cachedFamiliarProduct.isEmpty){
      return const [];
    }
    final cachedFamiliarProductTimestamp = getIt.call<ProductsCacheServices>().getTimeStampOfFamiliarProduct(1,productId);
    final isValidTime = getIt.call<ProductsCacheServices>().isValidTimeStamp(cachedFamiliarProductTimestamp!, globalExpiryDateForDelete);

    if(isValidTime){
      return cachedFamiliarProduct.map((model)=>model.toEntity()).toList();
    }else{
      getIt.call<ProductsCacheServices>().clearFamiliarProduct(productId);
      return const [];
    }
  }
}