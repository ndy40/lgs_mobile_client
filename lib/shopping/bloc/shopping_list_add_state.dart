import 'package:freezed_annotation/freezed_annotation.dart';

import '../models.dart';

part 'shopping_list_add_state.freezed.dart';

@freezed
abstract class ShoppingListAddState with _$ShoppingListAddState{
  const factory ShoppingListAddState.initial() = _ShoppingListAddInitial;
  const factory ShoppingListAddState.shoppingListChanged(ShoppingList list) = _ShoppingListChanged;
  const factory ShoppingListAddState.error({@required String message}) = _ShoppingListAddErrorState;

}