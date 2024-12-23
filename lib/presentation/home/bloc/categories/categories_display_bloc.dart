import "package:flutter_application_1/presentation/home/bloc/categories/categories_display_event.dart";
import "package:flutter_application_1/presentation/home/bloc/categories/categories_display_state.dart";
import "package:flutter_application_1/domain/categories/repository/category.dart";
import "package:flutter_application_1/servise_locator.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class CategoriesDisplayBloc extends Bloc<CategoriesDisplayEvent,CategoriesDisplayState>{

  CategoriesDisplayBloc():super(CategoriesLoadingState()){
    on<GetCategoriesEvent>(_appStarted);
    on<SelectCategoriesEvent>(_selectCategory);
  }


  void _appStarted(GetCategoriesEvent event, Emitter<CategoriesDisplayState> emit)async{
    final categories = await getIt.call<CategoryRepository>().getCategories();
    categories.fold((error){
      emit(CategoriesFailurState(error));
    }, (returnedCategories){
      emit(CategoriesLoadedState(returnedCategories));
    });
  }

  void _selectCategory(SelectCategoriesEvent event, Emitter<CategoriesDisplayState> emit)async{
    if(state is CategoriesLoadedState) {
      emit(CategoriesLoadedState((state as CategoriesLoadedState).categories,event.selectedIndex));
    }
  }

}

