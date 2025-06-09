import "package:dartz/dartz.dart";
import "../../../data/products/models/get_familiar_product_req.dart";
import "../../../data/products/models/get_product_py_category_req.dart";
import "../entity/product_entity.dart";

abstract class ProductsRepository{
  // this methods is fech from interned and refrech the cach and return the data
  Future<Either> getTopSellingProducts(int page);
  Future<Either> getPopularProducts(int page);
  Future<Either> getFlashSellProducts(int page);
  Future<Either> getFamiliarProduct(GetFamiliarProductReq getFamiliarProduct);
  Future<Either> getProductPyingInformation(String id);  ///
  Future<Either> getProductRatingInformation(String id); ///

  // this methods is fech from cach
  Future<List<ProductEntity>> getCacheTopSellingProducts();
  Future<List<ProductEntity>> getCachePopularProducts();
  Future<List<ProductEntity>> getCacheFlashSellProducts();
  Future<List<ProductEntity>> getCacheFamiliarProducts(String productId);
  Future<Either> getCacheProductPyingInformation(String id);
  Future<Either> getCacheProductRatingInformation(String id);

  // this methods can't  caching
  Future<Either> addProductToBookmark(String id);
  Future<Either> removeProductFromBookmark(String id);

  // this i don'n build the caching yet
  Future<Either> getProductsPyCategory(GetProductPyCategoryReq category);
  Future<Either> getBookmarkedProducts();
  bool isHaveEnoughDataInCache();
  
}