enum GenderType {
  notSpecified,
  male,
  female,
  other,
  preferNotToSay,
}

extension MyEnumExtension on GenderType {
  String toShortString() {
    if (this == GenderType.preferNotToSay) {
      return "profer not to say";
    } else if (this == GenderType.notSpecified) {
      return "not specified";
    }
    return toString().split('.').last;
  }
}

GenderType genderTypeFromString(String genderType) {
  switch (genderType) {
    case "profer not to say":
      return GenderType.preferNotToSay;
    case "male":
      return GenderType.male;
    case "other":
      return GenderType.other;
    case "female":
      return GenderType.female;
    default:
      return GenderType.notSpecified;
  }
}
