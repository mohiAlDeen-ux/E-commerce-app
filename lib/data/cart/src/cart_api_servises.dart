import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/cart/models/cart_item_models.dart';
import 'package:flutter_application_1/data/cart/models/cart_models.dart';
import "dart:convert";

String jsonExample = '''{
  "id": "cart_home_333",
  "userId": "user_home_99",
  "createdAt": "2025-06-07T10:15:00Z",
  "updatedAt": "2025-06-07T11:30:00Z",
  "currency": "US",
  
  "items": [
    {
      "id": "item_601",
      "productId": "prod_blanket_777",
      "name": "Wool Blanket",
      "selectedOptions": {
        "color": "navy_blue",
        "size": "king"
      },
      "price": 75.00,
      "currentPrice": 65.00,
      "quantity": 4,
      "image": "https://picsum.photos/id/10/200/300",
      "stock": 10,
      "discount": {
        "type": "bulk",
        "value": 10.00,
        "description": "Buy 3+ Save €10/unit"
      },
      "itemTotal": 260.00,
      "addedAt": "2025-06-07T10:20:15Z"
    },
    {
      "id": "item_602",
      "productId": "prod_vase_123",
      "name": "Ceramic Vase Set",
      "selectedOptions": {
        "style": "modern",
        "set_size": "3_pieces"
      },
      "price": 45.00,
      "currentPrice": 36.00,
      "quantity": 2,
      "image": "https://picsum.photos/id/10/200/300",
      "stock": 5,
      "discount": {
        "type": "promo",
        "value": 9.00,
        "description": "Home Decor Special"
      },
      "itemTotal": 72.00,
      "addedAt": "2025-06-07T11:15:30Z"
    }
  ],
  
  "pricing": {
    "subtotal": 332.00,
    "itemDiscounts": 58.00,
    "shipping": {
      "method": "express",
      "cost": 12.99,
      "description": "Next Day Delivery"
    },
    "tax": {
      "rate": 0.21,
      "amount": 69.72,
      "description": "VAT"
    },
    "total": 356.71,
    "currency": "EUR"
  },
  
  "shipping": {
    "method": "express",
    "address": {
      "fullName": "Elena Rossi",
      "street": "Via Roma 123",
      "city": "Milan",
      "state": "",
      "zipCode": "20121",
      "country": "Italy",
      "phone": "+39-02-1234567"
    },
    "estimatedDelivery": "2025-06-08T14:00:00Z"
  },
  
  "payment": {
    "method": "cash",
    "details": {
      "type": "on_delivery",
      "changeRequired": 43.29,
      "notes": "Customer will pay with €400"
    }
  }
}''';

abstract class CartApiServises {
  Future<Either> addCartItem(CartItemModels cartModels);
  Future<Either> removeItem(String productId);
  Future<Either> updateItemOption(String itemId, CartItemModels item);
  Future<Either> updateItemQuantity(String itemId, int quantity);
  Future<Either<String, CartModels>> getCartItems();
  Stream<Either> watchCart();
  Future<Either> clearCart();
  Future<Either> checkOut();
}

class CartApiServisesImp extends CartApiServises {
  @override
  Future<Either> addCartItem(CartItemModels cartModels) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<Either> checkOut() {
    // TODO: implement checkout
    throw UnimplementedError();
  }

  @override
  Future<Either> clearCart() {
    // TODO: implement clearCart
    throw UnimplementedError();
  }

  @override
  Future<Either<String, CartModels>> getCartItems() async {
    await Future.delayed(const Duration(seconds: 2));
    return Right(CartModels.fromMap(jsonDecode(jsonExample)));
  }

  @override
  Future<Either> removeItem(String productId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<Either> updateItemOption(String itemId, CartItemModels item) {
    // TODO: implement updateItemOption
    throw UnimplementedError();
  }

  @override
  Future<Either> updateItemQuantity(String itemId, int quantity) {
    // TODO: implement updateItemQuantity
    throw UnimplementedError();
  }

  @override
  Stream<Either> watchCart() {
    // TODO: implement watchCart
    throw UnimplementedError();
  }
}
