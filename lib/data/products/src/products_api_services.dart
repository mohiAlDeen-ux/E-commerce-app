import "package:dartz/dartz.dart";
import "package:flutter_application_1/data/products/models/get_product_py_category_req.dart";
import "package:http/http.dart" as http;

abstract class ProductsApiServices{
  Future<Either> getProductsPyCategory(GetProductPyCategoryReq category);
  Future<Either> getTopSelingProducts();
  Future<Either> getPopularProducts();
  Future<Either> getFlashSaleProducts();
  Future<Either> getFamiliarProduct(String id);
  Future<Either> addProductToBookmark(String id);
  Future<Either> removeProductFromBookmark(String id);
  Future<Either> isAvaliable(String id);
  Future<Either> getBookmarkedProducts();
  Future<Either> getProductPyingInformation(String id);
  Future<Either> getProductRatingInformation(String id);

}

class ProductsApiServicesImp extends ProductsApiServices{
  @override
  Future<Either> getFlashSaleProducts() async{
    // TODO: implement getFlashSaleProducts
    throw UnimplementedError();
  }

  @override
  Future<Either> getPopularProducts() async{
    // TODO: implement getPopularProducts
    throw UnimplementedError();
  }


  @override
  Future<Either> getProductsPyCategory(GetProductPyCategoryReq category) async{
    // TODO: implement getProductsPyCategory
    throw UnimplementedError();
  }
  
  @override
  Future<Either> getFamiliarProduct(String id) async{
    throw UnimplementedError();
  }

  @override
  Future<Either> getTopSelingProducts() async{
    // TODO: implement getTopSelingProducts
    throw UnimplementedError();
  }
  
  @override
  Future<Either> addProductToBookmark(String id) async {
    return Right(true);
  }
  
  @override
  Future<Either> removeProductFromBookmark(String id)async {
    return Right(true);

  }
  
  @override
  Future<Either> isAvaliable(String id) async{
    // TODO: implement isAvaliable
    throw UnimplementedError();
  }
  
  @override
  Future<Either> getBookmarkedProducts() async{
    // TODO: implement getBookmarkedProduct
    throw UnimplementedError();
  }
  
  @override
  Future<Either> getProductPyingInformation(String id) async{
    // TODO: implement getProductPyingInformation
    throw UnimplementedError();
  }
  
  @override
  Future<Either> getProductRatingInformation(String id) async{
    // TODO: implement getProductRatingInformation
    throw UnimplementedError();
  }


}