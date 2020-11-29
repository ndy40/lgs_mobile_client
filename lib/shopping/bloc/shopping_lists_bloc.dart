import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lgs_mobile_client/common/utils.dart';
import 'package:lgs_mobile_client/shopping/models.dart';
import 'package:lgs_mobile_client/shopping/services.dart';

part 'shopping_lists_event.dart';
part 'shopping_lists_state.dart';

class ShoppingListsBloc extends Bloc<ShoppingListsEvent, ShoppingListsState> {
  final ShoppingListService service;

  ShoppingListsBloc({this.service}) : super(ShoppingListsInitial());

  @override
  Stream<ShoppingListsState> mapEventToState(
    ShoppingListsEvent event,
  ) async* {

    if (event is ShoppingListsFetchInitial) {
      yield* _mapShoppingListsFetchToState(event);
    }
  }

  Stream<ShoppingListsState> _mapShoppingListsFetchToState(ShoppingListsEvent event) async* {
    try {
      yield ShoppingListsInitial();
      final collection = await service.getCollection();
      yield ShoppingListsLoaded(collection);
    } on Exception {
      print('Error raised');
    }
  }
}
