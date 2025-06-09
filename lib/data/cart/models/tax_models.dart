import 'package:flutter_application_1/domain/cart/entity/tax_entity.dart';

class TaxModels {
  final double rate;
  final double amount;
  final String description;

  TaxModels({
    required this.rate,
    required this.amount,
    required this.description,
  });

  factory TaxModels.fromMap(Map<String, dynamic> map) {
    return TaxModels(
      rate: (map['rate'] as num).toDouble(),
      amount: (map['amount'] as num).toDouble(),
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'amount': amount,
      'description': description,
    };
  }



  TaxEntity toEntity(){
    return TaxEntity(
      rate: rate,
      amount: amount,
      description: description
      );
  }
}