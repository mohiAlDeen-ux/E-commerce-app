class PaymentEntity {
  final String method;
  final Map<String, dynamic>? details;

  PaymentEntity({
    required this.method,
    this.details,
  });

  factory PaymentEntity.fromMap(Map<String, dynamic> map) {
    return PaymentEntity(
      method: map['method'] as String,
      details: map['details'] != null 
          ? Map<String, dynamic>.from(map['details'] as Map) 
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'method': method,
      'details': details,
    };
  }
}