import 'dart:convert';

import 'package:flutter_application_1/data/products/models/paying_information_model.dart';
import 'package:flutter_application_1/data/products/models/product_model.dart';
import 'package:flutter_application_1/data/products/models/rating_information_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

class CacheKeys {
  static const String prefix = "cach_product_";
  static const String popularProductsPage = '${prefix}popular_products_page_';
  static const String topSellingProductsPage = '${prefix}top_selling_products_page_';
  static const String product = '${prefix}product_';
  static const String productRating = '${prefix}product_rating_';
  static const String productPaying = '${prefix}product_paying_';
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
  Future<void> clearPopularProduct();
  DateTime? getTimeStampOfPopularProduct(int page);

  Future<void> cacheTopSellingProduct(List<ProductModel> products, int page);
  List<ProductModel> getTopSellingProduct(int page);
  Future<void> clearTopSellingProduct();
  DateTime? getTimeStampOfTopSellingProduct(int page);

  void clearAll();
  bool isValidTimeStamp(DateTime timeStamp, Duration expiryDate);
  DateTime? _getCacheTimestamp(String key);
  Future<void> _updateCacheTimestamp(String key);
}

class ProductsCacheServicesImp extends ProductsCacheServices {
  final SharedPreferences _sharedPreferences =
      GetIt.instance<SharedPreferences>();

  @override
  Future<void> cachePopularProduct(List<ProductModel> products, int page) async {
    await _cacheProductList(products, CacheKeys.popularProductsPage, page);
  }

  @override
  List<ProductModel> getPopularProduct(int page) {
    final jsonString = _sharedPreferences.getString('${CacheKeys.popularProductsPage}$page');
    final timestamp =  _getCacheTimestamp('${CacheKeys.popularProductsPage}$page${CacheKeys.timestampSuffix}');

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
    return _getCacheTimestamp("${CacheKeys.popularProductsPage}$page${CacheKeys.timestampSuffix}");
  }

  @override
  Future<void> cacheProduct(ProductModel product) async {
    await _sharedPreferences.setString(
        '${CacheKeys.product}${product.id}', product.toJson());
    await _updateCacheTimestamp('${CacheKeys.product}${product.id}${CacheKeys.timestampSuffix}');

  }

  @override
  ProductModel? getProduct(String productId) {
    final jsonString = _sharedPreferences.getString('${CacheKeys.product}$productId');
    return jsonString == null ? null : ProductModel.fromJson(jsonString);
  }

  @override
  Future<void> deleteProduct(String productId) async {
    await _sharedPreferences.remove('${CacheKeys.product}$productId');
    await _sharedPreferences.remove('${CacheKeys.product}$productId${CacheKeys.timestampSuffix}');
  }

  @override
  DateTime? getTimeStampOfProduct(String productId) {
    return _getCacheTimestamp("${CacheKeys.product}$productId${CacheKeys.timestampSuffix}");
  }

  @override
  Future<void> cacheTopSellingProduct(List<ProductModel> products, int page) async { 
  await _cacheProductList(products, CacheKeys.topSellingProductsPage, page);
    
  }

  @override
  List<ProductModel> getTopSellingProduct(int page) {
    final jsonString = _sharedPreferences.getString('${CacheKeys.topSellingProductsPage}$page');
    final timestamp = _getCacheTimestamp('${CacheKeys.topSellingProductsPage}$page${CacheKeys.timestampSuffix}');

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
  Future<void> clearTopSellingProduct() async{
    final keys = _sharedPreferences
        .getKeys()
        .where((key) => key.startsWith(CacheKeys.topSellingProductsPage));
    for (final key in keys) {
      await _sharedPreferences.remove(key);
    }
  }

  @override
  DateTime? getTimeStampOfTopSellingProduct(int page) {
    return _getCacheTimestamp('${CacheKeys.topSellingProductsPage}$page${CacheKeys.timestampSuffix}');
  }

  @override
  Future<void> cacheProductPayingInformation(PayingInformationModel payingInformation) async {
    await _sharedPreferences.setString('${CacheKeys.productPaying}${payingInformation.id}', payingInformation.toJson());
    await _updateCacheTimestamp('${CacheKeys.productPaying}${payingInformation.id}${CacheKeys.timestampSuffix}');
  }

  @override
  Future<void> deleteProductPayingInformation(String productId) async {
    await _sharedPreferences.remove('${CacheKeys.productPaying}$productId');
    await _sharedPreferences.remove('${CacheKeys.productPaying}$productId${CacheKeys.timestampSuffix}');
  }

  @override
  PayingInformationModel? getProductPayingInformation(String productId) {
    final jsonString = _sharedPreferences.getString('${CacheKeys.productPaying}$productId');
    print(jsonString);

    return jsonString == null
        ? null
        : PayingInformationModel.fromJson(jsonString);
  }

  @override
  DateTime? getTimeStampOfPayingInformation(String productId) {
    return _getCacheTimestamp("${CacheKeys.productPaying}$productId${CacheKeys.timestampSuffix}");
  }

  @override
  Future<void> cacheProductRatingInformation(RatingInformationModel ratingInformation) async {
    await _sharedPreferences.setString('${CacheKeys.productRating}${ratingInformation.id}', ratingInformation.toJson());
    await _updateCacheTimestamp('${CacheKeys.productRating}${ratingInformation.id}${CacheKeys.timestampSuffix}');
  }

  @override
  Future<void> deleteProductRatingInformation(String productId) async {
    await _sharedPreferences.remove('${CacheKeys.product}$productId');
    await _sharedPreferences.remove('${CacheKeys.product}$productId${CacheKeys.timestampSuffix}');
  }

  @override
  RatingInformationModel? getProductRatingInformation(String productId) {
    final jsonString = _sharedPreferences.getString('${CacheKeys.productRating}$productId');
    return jsonString == null
        ? null
        : RatingInformationModel.fromJson(jsonString);
  }

  @override
  DateTime? getTimeStampOfRatingInformation(String productId) {
    return _getCacheTimestamp('${CacheKeys.productRating}$productId${CacheKeys.timestampSuffix}');
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

  Future<void> _cacheProductList(List<ProductModel> products, String cacheKey, int page) async {
  final productIds = products.map((product) => product.id).toList();
  final jsonString = jsonEncode(productIds);
  await _sharedPreferences.setString('$cacheKey$page', jsonString);
  await _updateCacheTimestamp('$cacheKey$page${CacheKeys.timestampSuffix}');
  for (final product in products) {
    await cacheProduct(product);
  }
}

  @override
  DateTime? _getCacheTimestamp(String key) {
    final timestampString = _sharedPreferences.getString(key);
    if (timestampString != null) {
      return DateTime.parse(timestampString);
    }
    return null;
  }

  @override
  Future<void> _updateCacheTimestamp(String key) async {
    final timestamp = DateTime.now().toIso8601String();
    await _sharedPreferences.setString(key, timestamp);
  }
  
  @override
  bool isValidTimeStamp(DateTime timeStamp, Duration expiryDate) {
    return DateTime.now().difference(timeStamp) < expiryDate;
  }

}
