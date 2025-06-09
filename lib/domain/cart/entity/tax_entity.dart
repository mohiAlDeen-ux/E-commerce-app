class TaxEntity {
  final double rate;
  final double amount;
  final String description;

  TaxEntity({
    required this.rate,
    required this.amount,
    required this.description,
  });

  factory TaxEntity.fromMap(Map<String, dynamic> map) {
    return TaxEntity(
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
}