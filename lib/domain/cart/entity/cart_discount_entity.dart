class CartDiscountEntity {
  final String? code;
  final String type;
  final double value;
  final double amount;
  final String description;

  CartDiscountEntity({
    this.code,
    required this.type,
    required this.value,
    required this.amount,
    required this.description,
  });

  factory CartDiscountEntity.fromMap(Map<String, dynamic> map) {
    return CartDiscountEntity(
      code: map['code'] as String?,
      type: map['type'] as String,
      value: (map['value'] as num).toDouble(),
      amount: (map['amount'] as num).toDouble(),
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (code != null) 'code': code,
      'type': type,
      'value': value,
      'amount': amount,
      'description': description,
    };
  }
}