import 'dart:convert';

import 'package:flutter_application_1/data/products/models/paying_information_model.dart';
import 'package:flutter_application_1/data/products/models/product_model.dart';
import 'package:flutter_application_1/data/products/models/rating_information_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

class CacheKeys {
  static const String prefix = "cach_product_";
  static const String popularProductsPage = '${prefix}popular_products_page_';
  static const String topSellingProductsPage =
      '${prefix}top_selling_products_page_';
  static const String flahsSellProductsPage =
      '${prefix}flash_sell_products_page_';
  static const String product = '${prefix}product_';
  static const String productRating = '${prefix}product_rating_';
  static const String productPaying = '${prefix}product_paying_';
  static const String familiarProduct = '${prefix}familiar_product_';
  static const String timestampSuffix = '_timestamp';
}

abstract class ProductsCacheServices {
  ProductModel? getProduct(String productId);
  Future<void> cacheProduct(ProductModel product);
  Future<void> deleteProduct(String productId);
  DateTime? getTimeStampOfProduct(String productId);

  Future<void> cacheProductRatingInformation(
      RatingInformationModel ratingInformation);
  RatingInformationModel? getProductRatingInformation(String productId);
  Future<void> deleteProductRatingInformation(String productId);
  DateTime? getTimeStampOfRatingInformation(String productId);

  Future<void> cacheProductPayingInformation(
      PayingInformationModel payingInformation);
  PayingInformationModel? getProductPayingInformation(String productId);
  Future<void> deleteProductPayingInformation(String productId);
  DateTime? getTimeStampOfPayingInformation(String productId);

  Future<void> cachePopularProduct(List<ProductModel> products, int page);
  List<ProductModel> getPopularProduct(int page);
  List<ProductModel> getAllPopularProduct();
  Future<void> clearPopularProduct();
  DateTime? getTimeStampOfPopularProduct(int page);

  Future<void> cacheFlashSellProduct(List<ProductModel> products, int page);
  List<ProductModel> getFlashSellProduct(int page);
  List<ProductModel> getAllFlashSellProduct();
  Future<void> clearFlashSellProduct();
  DateTime? getTimeStampOfFlashSellProduct(int page);

  Future<void> cacheTopSellingProduct(List<ProductModel> products, int page);
  List<ProductModel> getTopSellingProduct(int page);
  List<ProductModel> getAllTopSellingProduct();
  Future<void> clearTopSellingProduct();
  DateTime? getTimeStampOfTopSellingProduct(int page);

  Future<void> cacheFamiliarProduct(List<ProductModel> products, int page, String productId);
  List<ProductModel> getFamiliarProduct(int page, String productId);
  List<ProductModel> getAllFamiliarProduct(String productId);
  Future<void> clearFamiliarProduct(String productId);
  DateTime? getTimeStampOfFamiliarProduct(int page, String productId);

  bool isHaveEnoughData();
  void clearAll();
  bool isValidTimeStamp(DateTime timeStamp, Duration expiryDate);
}

class ProductsCacheServicesImp extends ProductsCacheServices {
  final SharedPreferences _sharedPreferences =
      GetIt.instance<SharedPreferences>();

  @override
  Future<void> cachePopularProduct(
      List<ProductModel> products, int page) async {
    await _cacheProductList(products, CacheKeys.popularProductsPage, page);
  }

  @override
  List<ProductModel> getPopularProduct(int page) {
    return _getProductList(CacheKeys.popularProductsPage, page);
  }

  @override
  Future<void> clearPopularProduct() async {
    final keys = _sharedPreferences
        .getKeys()
        .where((key) => key.startsWith(CacheKeys.popularProductsPage));
    for (final key in keys) {
      await _sharedPreferences.remove(key);
    }
  }

  @override
  DateTime? getTimeStampOfPopularProduct(int page) {
    return _getCacheTimestamp(
        "${CacheKeys.popularProductsPage}$page${CacheKeys.timestampSuffix}");
  }

  @override
  Future<void> cacheProduct(ProductModel product) async {
    await _sharedPreferences.setString(
        '${CacheKeys.product}${product.id}', product.toJson());
    await _updateCacheTimestamp(
        '${CacheKeys.product}${product.id}${CacheKeys.timestampSuffix}');
  }

  @override
  ProductModel? getProduct(String productId) {
    final jsonString =
        _sharedPreferences.getString('${CacheKeys.product}$productId');
    return jsonString == null ? null : ProductModel.fromJson(jsonString);
  }

  @override
  Future<void> deleteProduct(String productId) async {
    await _sharedPreferences.remove('${CacheKeys.product}$productId');
    await _sharedPreferences
        .remove('${CacheKeys.product}$productId${CacheKeys.timestampSuffix}');
  }

  @override
  DateTime? getTimeStampOfProduct(String productId) {
    return _getCacheTimestamp(
        "${CacheKeys.product}$productId${CacheKeys.timestampSuffix}");
  }

  @override
  Future<void> cacheTopSellingProduct(
      List<ProductModel> products, int page) async {
    await _cacheProductList(products, CacheKeys.topSellingProductsPage, page);
  }

  @override
  List<ProductModel> getTopSellingProduct(int page) {
    return _getProductList(CacheKeys.topSellingProductsPage, page);
  }

  @override
  Future<void> clearTopSellingProduct() async {
    final keys = _sharedPreferences
        .getKeys()
        .where((key) => key.startsWith(CacheKeys.topSellingProductsPage));
    for (final key in keys) {
      await _sharedPreferences.remove(key);
    }
  }

  @override
  Future<void> cacheFlashSellProduct(
      List<ProductModel> products, int page) async {
    await _cacheProductList(products, CacheKeys.flahsSellProductsPage, page);
  }

  @override
  Future<void> clearFlashSellProduct() async {
    final keys = _sharedPreferences
        .getKeys()
        .where((key) => key.startsWith(CacheKeys.flahsSellProductsPage));
    for (final key in keys) {
      await _sharedPreferences.remove(key);
    }
  }

  @override
  List<ProductModel> getFlashSellProduct(int page) {
    return _getProductList(CacheKeys.flahsSellProductsPage, page);
  }

  @override
  DateTime? getTimeStampOfFlashSellProduct(int page) {
    return _getCacheTimestamp(
        '${CacheKeys.flahsSellProductsPage}$page${CacheKeys.timestampSuffix}');
  }

  @override
  DateTime? getTimeStampOfTopSellingProduct(int page) {
    return _getCacheTimestamp(
        '${CacheKeys.topSellingProductsPage}$page${CacheKeys.timestampSuffix}');
  }

  @override
  Future<void> cacheProductPayingInformation(
      PayingInformationModel payingInformation) async {
    await _sharedPreferences.setString(
        '${CacheKeys.productPaying}${payingInformation.id}',
        payingInformation.toJson());
    await _updateCacheTimestamp(
        '${CacheKeys.productPaying}${payingInformation.id}${CacheKeys.timestampSuffix}');
  }

  @override
  Future<void> deleteProductPayingInformation(String productId) async {
    await _sharedPreferences.remove('${CacheKeys.productPaying}$productId');
    await _sharedPreferences.remove(
        '${CacheKeys.productPaying}$productId${CacheKeys.timestampSuffix}');
  }

  @override
  PayingInformationModel? getProductPayingInformation(String productId) {
    final jsonString =
        _sharedPreferences.getString('${CacheKeys.productPaying}$productId');

    return jsonString == null
        ? null
        : PayingInformationModel.fromJson(jsonString);
  }

  @override
  DateTime? getTimeStampOfPayingInformation(String productId) {
    return _getCacheTimestamp(
        "${CacheKeys.productPaying}$productId${CacheKeys.timestampSuffix}");
  }

  @override
  Future<void> cacheProductRatingInformation(
      RatingInformationModel ratingInformation) async {
    await _sharedPreferences.setString(
        '${CacheKeys.productRating}${ratingInformation.id}',
        ratingInformation.toJson());
    await _updateCacheTimestamp(
        '${CacheKeys.productRating}${ratingInformation.id}${CacheKeys.timestampSuffix}');
  }

  @override
  Future<void> deleteProductRatingInformation(String productId) async {
    await _sharedPreferences.remove('${CacheKeys.product}$productId');
    await _sharedPreferences
        .remove('${CacheKeys.product}$productId${CacheKeys.timestampSuffix}');
  }

  @override
  RatingInformationModel? getProductRatingInformation(String productId) {
    final jsonString =
        _sharedPreferences.getString('${CacheKeys.productRating}$productId');
    return jsonString == null
        ? null
        : RatingInformationModel.fromJson(jsonString);
  }

  @override
  DateTime? getTimeStampOfRatingInformation(String productId) {
    return _getCacheTimestamp(
        '${CacheKeys.productRating}$productId${CacheKeys.timestampSuffix}');
  }

  @override
  Future<void> clearAll() async {
    final keys = _sharedPreferences
        .getKeys()
        .where((key) => key.startsWith(CacheKeys.prefix));
    for (final key in keys) {
      await _sharedPreferences.remove(key);
    }
  }

  Future<void> _cacheProductList(
      List<ProductModel> products, String cacheKey, int page) async {
    final productIds = products.map((product) => product.id).toList();
    final jsonString = jsonEncode(productIds);
    await _sharedPreferences.setString('$cacheKey$page', jsonString);
    await _updateCacheTimestamp('$cacheKey$page${CacheKeys.timestampSuffix}');
    for (final product in products) {
      await cacheProduct(product);
    }
  }

  DateTime? _getCacheTimestamp(String key) {
    final timestampString = _sharedPreferences.getString(key);
    if (timestampString != null) {
      return DateTime.parse(timestampString);
    }
    return null;
  }

  Future<void> _updateCacheTimestamp(String key) async {
    final timestamp = DateTime.now().toIso8601String();
    await _sharedPreferences.setString(key, timestamp);
  }

  @override
  bool isValidTimeStamp(DateTime timeStamp, Duration expiryDate) {
    return DateTime.now().difference(timeStamp) < expiryDate;
  }

  @override
  List<ProductModel> getAllFlashSellProduct() {
    return _getAllProductList(CacheKeys.flahsSellProductsPage);
  }

  @override
  List<ProductModel> getAllPopularProduct() {
    return _getAllProductList(CacheKeys.popularProductsPage);
  }

  @override
  List<ProductModel> getAllTopSellingProduct() {
    return _getAllProductList(CacheKeys.topSellingProductsPage);
  }

  List<ProductModel> _removeDuplicates(List<ProductModel> products) {
  final Set<String> seenIds = {};
  final List<ProductModel> uniqueProducts = [];

  for (final product in products) {
    if (!seenIds.contains(product.id)) {
      seenIds.add(product.id);
      uniqueProducts.add(product);
    }
  }

  return uniqueProducts;
  }

  List<ProductModel> _getProductList(String cacheKey, int page) {
    final jsonString = _sharedPreferences.getString('$cacheKey$page');
    final timestamp =
        _getCacheTimestamp('$cacheKey$page${CacheKeys.timestampSuffix}');


    if (jsonString != null && timestamp != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
          
      return jsonList.map((json) {
        final product = getProduct(json);
        return product!;
      }).toList();
    }
    return [];
  }
  
  @override
  bool isHaveEnoughData() {
    if(getPopularProduct(1) == [] || getTopSellingProduct(1) == [] || getFlashSellProduct(1) == []){
      return false;
    }
    return true;
  }
  
  @override
  Future<void> cacheFamiliarProduct(List<ProductModel> products, int page, String productId) async{
    await _cacheProductList(products, "${CacheKeys.familiarProduct}${productId}_", page);
  }
  
  @override
  Future<void> clearFamiliarProduct(String productId) async{
        final keys = _sharedPreferences
        .getKeys()
        .where((key) => key.startsWith("${CacheKeys.familiarProduct}$productId"));
    for (final key in keys) {
      await _sharedPreferences.remove(key);
    }
  }
  
    List<ProductModel> _getAllProductList(String cacheKey){
    final List<ProductModel> allProducts = [];
    int page = 1;

    while (true) {
      final products =  _getProductList(cacheKey, page);


      if (products.isEmpty) {
        break;
      }
      allProducts.addAll(products);
      page++;
    }
    final uniqueProducts = _removeDuplicates(allProducts);

    return uniqueProducts;
  }

  @override
  List<ProductModel> getAllFamiliarProduct(String productId) {
    return _getAllProductList("${CacheKeys.familiarProduct}$productId");
  }
  
  @override
  List<ProductModel> getFamiliarProduct(int page, String productId) {
    return _getProductList("${CacheKeys.familiarProduct}${productId}_", page);
  }
  
  @override
  DateTime? getTimeStampOfFamiliarProduct(int page, String productId) {
        return _getCacheTimestamp('${CacheKeys.familiarProduct}$productId$page${CacheKeys.timestampSuffix}');
  }
}
