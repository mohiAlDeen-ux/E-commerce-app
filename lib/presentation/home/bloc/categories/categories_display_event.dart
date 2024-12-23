abstract class CategoriesDisplayEvent{}

class GetCategoriesEvent extends CategoriesDisplayEvent{}

class SelectCategoriesEvent extends CategoriesDisplayEvent{
  int selectedIndex;
  SelectCategoriesEvent(this.selectedIndex);
}