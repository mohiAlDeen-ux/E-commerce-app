class ProductEntity {
  bool bookmark;
  final String id;
  final List<String> images;
  final String brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;

  ProductEntity({
    required this.bookmark,
    required this.id,
    required this.images,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });

  ProductEntity copyWith({bool? bookmark}) {
    return ProductEntity( 
    id: this.id,
    images: this.images,
    brandName: this.brandName,
    title: this.title,
    price: this.price,
    priceAfetDiscount: this.priceAfetDiscount,
    dicountpercent: this.dicountpercent,
    bookmark: bookmark ?? this.bookmark,
    ); 
  
  }
}