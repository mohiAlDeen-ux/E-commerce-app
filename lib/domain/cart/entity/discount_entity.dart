class DiscountEntity {
  final String type;
  final double value;
  final String description;

  DiscountEntity({
    required this.type,
    required this.value,
    required this.description,
  });

  factory DiscountEntity.fromMap(Map<String, dynamic> map) {
    return DiscountEntity(
      type: map['type'] as String,
      value: (map['value'] as num).toDouble(),
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'value': value,
      'description': description,
    };
  }
}