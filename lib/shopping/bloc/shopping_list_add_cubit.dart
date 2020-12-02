import 'package:bloc/bloc.dart';
import 'shopping_list_add_state.dart';


class ShoppingListAddCubit extends Cubit<ShoppingListAddState> {
  ShoppingListAddCubit() : super(ShoppingListAddState.initial());

  void titleUpdated(String title) {
    // state.maybeWhen(orElse: null)
  }
  
  
}
