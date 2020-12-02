import 'dart:async';

import 'package:bloc/bloc.dart';

import 'screen_tabs_event.dart';
import 'screen_tabs_state.dart';

class ScreenTabsBloc extends Bloc<ScreenTabsEvent, ScreenTabsState> {
  ScreenTabsBloc() : super(ScreenTabsState.initial());

  List<TabsPage> pages;

  @override
  Stream<ScreenTabsState> mapEventToState(
    ScreenTabsEvent event,
  ) async* {
    yield event.maybeWhen(
        initial: () => ScreenTabsState.initial(),
        tabChanged: (index) => _mapTabChangeEventToState(index),
        );
  }

  ScreenTabsState _mapTabChangeEventToState(int index) {
    if (index <=  pages.length - 1 ) {
      return ScreenTabsState.loaded(pages[index]);
    }

    return state;
  }
}
