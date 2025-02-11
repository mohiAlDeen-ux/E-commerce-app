import "package:dartz/dartz.dart";
import "package:flutter_application_1/data/products/models/get_product_py_category_req.dart";

abstract class ProductsRepository{
  // this methods is fech from interned and refrech the cach and return the data
  Future<Either> getTopSellingProducts(int page);
  Future<Either> getPopularProducts(int page);
  Future<Either> getFlashSaleProducts(int page);
  Future<Either> getFamiliarProduct(String id);
  Future<Either> getProductPyingInformation(String id);
  Future<Either> getProductRatingInformation(String id);

  // this methods is fech from cach
  Future<Either> getCacheTopSellingProducts(int page);
  Future<Either> getCachePopularProducts(int page);
  Future<Either> getCacheFlashSaleProducts(int page);
  Future<Either> getCacheProductPyingInformation(String id);
  Future<Either> getCacheProductRatingInformation(String id);

  // this methods can't  caching
  Future<Either> addProductToBookmark(String id);
  Future<Either> removeProductFromBookmark(String id);

  // this i don'n build the caching yet
  Future<Either> getProductsPyCategory(GetProductPyCategoryReq category);
  Future<Either> getBookmarkedProducts();
  
}