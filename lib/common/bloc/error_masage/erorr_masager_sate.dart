abstract class ErrorMasageState{
  String errorMasage;
  ErrorMasageState(this.errorMasage);
}

class ErrorMasageShowState extends ErrorMasageState{
  String errorMasage; 
  ErrorMasageShowState(this.errorMasage):super(errorMasage);
}

class ErrorMasageDisappearsState extends ErrorMasageState{
  String errorMasage; 
  ErrorMasageDisappearsState(this.errorMasage):super(errorMasage);
}