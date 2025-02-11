class ProductEntity {
  bool bookmark;
  final bool isAvaliable;
  final String id;
  final List<String> images;
  final String brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;
  final String category;
  final String subCategory;

  ProductEntity({
    required this.isAvaliable,
    required this.bookmark,
    required this.id,
    required this.images,
    required this.brandName,
    required this.title,
    required this.price,
    required this.category,
    required this.subCategory,
    this.priceAfetDiscount,
    this.dicountpercent,
    
  });

  ProductEntity copyWith({bool? bookmark}) {
    return ProductEntity( 
    isAvaliable: isAvaliable,
    id: id,
    images: images,
    brandName: brandName,
    title: title,
    price: price,
    priceAfetDiscount: priceAfetDiscount,
    dicountpercent: dicountpercent,
    bookmark: bookmark ?? this.bookmark,
    category: category,
    subCategory: subCategory
    ); 
  
  }
}