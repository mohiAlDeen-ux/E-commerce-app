import "package:dartz/dartz.dart";

abstract class ProductsRepository{
  Future<Either> getProductPyId(String id);
  Future<Either> getProductsPyCategory(String categoryId);
  Future<Either> getTopSellingProducts();
  Future<Either> getPopularProducts();
  Future<Either> getFlashSaleProducts();
  Future<Either> getFamiliarProduct(String id);
  Future<Either> addProductToBookmark(String id);
  Future<Either> removeProductFromBookmark(String id);
  Future<Either> isAvaliable(String id);
}