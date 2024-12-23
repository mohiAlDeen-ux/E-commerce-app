import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;

abstract class ProductsApiServices{
  Future<Either> getProductPyId(String id);
  Future<Either> getProductsPyCategory(String categoryId);
  Future<Either> getTopSelingProducts();
  Future<Either> getPopularProducts();
  Future<Either> getFlashSaleProducts();
}

class ProductsApiServicesImp extends ProductsApiServices{
  @override
  Future<Either> getFlashSaleProducts() {
    // TODO: implement getFlashSaleProducts
    throw UnimplementedError();
  }

  @override
  Future<Either> getPopularProducts() {
    // TODO: implement getPopularProducts
    throw UnimplementedError();
  }

  @override
  Future<Either> getProductPyId(String id) {
    // TODO: implement getProductPyId
    throw UnimplementedError();
  }

  @override
  Future<Either> getProductsPyCategory(String categoryId) {
    // TODO: implement getProductsPyCategory
    throw UnimplementedError();
  }

  @override
  Future<Either> getTopSelingProducts() {
    // TODO: implement getTopSelingProducts
    throw UnimplementedError();
  }


}