import 'package:flutter_application_1/domain/categories/entity/categories_entity.dart';

abstract class CategoriesDisplayState{}

class CategoriesLoadingState extends CategoriesDisplayState{}

class CategoriesFailurState extends CategoriesDisplayState{
  String error;
  CategoriesFailurState(this.error);
}

class CategoriesLoadedState extends CategoriesDisplayState{
  List<CategoryEntity> categories;
  int? selectedIndex;

  CategoriesLoadedState(this.categories, [this.selectedIndex]);
}