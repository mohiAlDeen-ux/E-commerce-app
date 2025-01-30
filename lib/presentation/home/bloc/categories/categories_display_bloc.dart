import "../../../../domain/categories/usecase/get_categories_usecase.dart";
import "categories_display_event.dart";
import "categories_display_state.dart";
import "../../../../servise_locator.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class CategoriesDisplayBloc extends Bloc<CategoriesDisplayEvent,CategoriesDisplayState>{

  CategoriesDisplayBloc():super(CategoriesLoadingState()){
    on<GetCategoriesEvent>(_appStarted);
    on<SelectCategoriesEvent>(_selectCategory);
  }


  void _appStarted(GetCategoriesEvent event, Emitter<CategoriesDisplayState> emit)async{
    final categories = await getIt.call<GetCategoriesUsecase>().call();
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

