enum GenderType{
  male,
  female,
  other,
  preferNotToSay,
}


extension MyEnumExtension on GenderType {
   String toShortString() {
    if(this == GenderType.preferNotToSay){
      return "profer not to say";
    }
     return this.toString().split('.').last;
    } 
  }