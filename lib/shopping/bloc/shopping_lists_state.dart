part of 'shopping_lists_bloc.dart';

abstract class ShoppingListsState extends Equatable {
  const ShoppingListsState();
  @override
  List<Object> get props => [];
}

class ShoppingListsInitial extends ShoppingListsState {}

class ShoppingListsLoaded extends ShoppingListsState {
  final HydraCollection<ShoppingList> collection;

  const ShoppingListsLoaded(this.collection);

  @override
  List<Object> get props => [collection];
}
