import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_tabs_event.freezed.dart';

@freezed
abstract class ScreenTabsEvent with _$ScreenTabsEvent{
  const factory ScreenTabsEvent.initial() = _ScreenTabsEventInitial;
  const factory ScreenTabsEvent.tabChanged({@Default(0) int index}) = _ScreenTabChanged;
  const factory ScreenTabsEvent.tabLoaded() = _ScreenTabLoaded;
}
