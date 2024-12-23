abstract class ErrorMasageState{
  String ErrorMasage;
  ErrorMasageState(this.ErrorMasage);
}

class ErrorMasageShowState extends ErrorMasageState{
  String ErrorMasage; 
  ErrorMasageShowState(this.ErrorMasage):super(ErrorMasage);
}

class ErrorMasageDisappearsState extends ErrorMasageState{
  String ErrorMasage; 
  ErrorMasageDisappearsState(this.ErrorMasage):super(ErrorMasage);
}