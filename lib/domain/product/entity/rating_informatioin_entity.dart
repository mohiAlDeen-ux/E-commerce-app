class RatingInformatioinEntity{
  final String id;
  final double rating;
  final int numOfReviews;
  final int numOfFiveStar;
  final int numOfFourStar;
  final int numOfThreeStar;
  final int numOfTwoStar;
  final int numOfOneStar;
  final String description;

 const RatingInformatioinEntity({
    required this.id,
    required this.rating,
    required this.numOfReviews,
    required this.numOfFiveStar,
    required this.numOfFourStar,
    required this.numOfThreeStar,
    required this.numOfTwoStar,
    required this.numOfOneStar,
    required this.description,
  });

}