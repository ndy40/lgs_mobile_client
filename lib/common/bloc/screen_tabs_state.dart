import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_tabs_state.freezed.dart';

@freezed
abstract class TabsPage with _$TabsPage {
  const factory TabsPage(Widget child, {@required String title, Icon icon}) =
      TabScreen;
}

@freezed
abstract class ScreenTabsState with _$ScreenTabsState {
  const factory ScreenTabsState.initial() = _ScreenTabsInitial;
  const factory ScreenTabsState.changed({int index}) = _ScreenTabChanged;
  const factory ScreenTabsState.loaded(TabsPage page) = _ScreenTabsLoaded;
}
