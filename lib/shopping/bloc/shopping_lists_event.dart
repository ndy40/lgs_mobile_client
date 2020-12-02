part of 'shopping_lists_bloc.dart';

abstract class ShoppingListsEvent extends Equatable {
  const ShoppingListsEvent();

  @override
  List<Object> get props => [];
}

class ShoppingListsFetchStarted extends ShoppingListsEvent {}

class ShoppingListsFetched extends ShoppingListsEvent {}

class ShoppingListDeleted extends ShoppingListsEvent {
  final ShoppingList shoppingList;

  const ShoppingListDeleted({this.shoppingList});

  @override
  List<Object> get props => [shoppingList];
}