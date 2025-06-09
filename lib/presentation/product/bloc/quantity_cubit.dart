import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityCubit extends Cubit<int> {
  QuantityCubit({int? initialQuantity})
      : super(_validateQuantity(initialQuantity ?? 1));

  static int _validateQuantity(int quantity) {
    return quantity < 1 ? 1 : quantity;
  }

  void increment() {
    if (state < 999) {
      emit(state + 1);
    }
  }

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}