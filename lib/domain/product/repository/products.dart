import "package:dartz/dartz.dart";

abstract class ProductsRepository{
  Future<Either> getProductPyId(String id);
  Future<Either> getProductsPyCategory(String categoryId);
  Future<Either> getTopSelingProducts();
  Future<Either> getPopularProducts();
  Future<Either> getFlashSaleProducts();
}