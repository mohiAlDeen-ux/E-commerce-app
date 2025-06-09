import 'package:flutter_application_1/domain/cart/entity/discount_entity.dart';

class CartItemEntity {
  final String id;
  final String productId;
  final String name;
  final Map<String, dynamic> selectedOptions;
  final double price;
  final double currentPrice;
  final int quantity;
  final String image;
  final int stock;
  final DiscountEntity? discount;
  final double itemTotal;
  final DateTime addedAt;

  CartItemEntity({
    required this.id,
    required this.productId,
    required this.name,
    required this.selectedOptions,
    required this.price,
    required this.currentPrice,
    required this.quantity,
    required this.image,
    required this.stock,
    this.discount,
    required this.itemTotal,
    required this.addedAt,
  });

  factory CartItemEntity.fromMap(Map<String, dynamic> map) {
    return CartItemEntity(
      id: map['id'] as String,
      productId: map['productId'] as String,
      name: map['name'] as String,
      selectedOptions: Map<String, dynamic>.from(map['selectedOptions'] as Map),
      price: (map['price'] as num).toDouble(),
      currentPrice: (map['currentPrice'] as num).toDouble(),
      quantity: map['quantity'] as int,
      image: map['image'] as String,
      stock: map['stock'] as int,
      discount: map['discount'] != null 
          ? DiscountEntity.fromMap(map['discount'] as Map<String, dynamic>) 
          : null,
      itemTotal: (map['itemTotal'] as num).toDouble(),
      addedAt: DateTime.parse(map['addedAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'name': name,
      'selectedOptions': selectedOptions,
      'price': price,
      'currentPrice': currentPrice,
      'quantity': quantity,
      'image': image,
      'stock': stock,
      'discount': discount?.toMap(),
      'itemTotal': itemTotal,
      'addedAt': addedAt.toIso8601String(),
    };
  }
}