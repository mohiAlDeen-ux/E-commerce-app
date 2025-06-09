class AddressEntity {
  final String fullName;
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String phone;

  AddressEntity({
    required this.fullName,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.phone,
  });

  factory AddressEntity.fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      fullName: map['fullName'] as String,
      street: map['street'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      zipCode: map['zipCode'] as String,
      country: map['country'] as String,
      phone: map['phone'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
      'phone': phone,
    };
  }
}