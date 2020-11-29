part of 'shopping_lists_bloc.dart';

abstract class ShoppingListsEvent extends Equatable {
  const ShoppingListsEvent();

  @override
  List<Object> get props => [];
}

class ShoppingListsFetchInitial extends ShoppingListsEvent {}

class ShoppingListsFetched extends ShoppingListsEvent {}