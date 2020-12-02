// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'screen_tabs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TabsPageTearOff {
  const _$TabsPageTearOff();

// ignore: unused_element
  TabScreen call(Widget child, {@required String title, Icon icon}) {
    return TabScreen(
      child,
      title: title,
      icon: icon,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TabsPage = _$TabsPageTearOff();

/// @nodoc
mixin _$TabsPage {
  Widget get child;
  String get title;
  Icon get icon;

  $TabsPageCopyWith<TabsPage> get copyWith;
}

/// @nodoc
abstract class $TabsPageCopyWith<$Res> {
  factory $TabsPageCopyWith(TabsPage value, $Res Function(TabsPage) then) =
      _$TabsPageCopyWithImpl<$Res>;
  $Res call({Widget child, String title, Icon icon});
}

/// @nodoc
class _$TabsPageCopyWithImpl<$Res> implements $TabsPageCopyWith<$Res> {
  _$TabsPageCopyWithImpl(this._value, this._then);

  final TabsPage _value;
  // ignore: unused_field
  final $Res Function(TabsPage) _then;

  @override
  $Res call({
    Object child = freezed,
    Object title = freezed,
    Object icon = freezed,
  }) {
    return _then(_value.copyWith(
      child: child == freezed ? _value.child : child as Widget,
      title: title == freezed ? _value.title : title as String,
      icon: icon == freezed ? _value.icon : icon as Icon,
    ));
  }
}

/// @nodoc
abstract class $TabScreenCopyWith<$Res> implements $TabsPageCopyWith<$Res> {
  factory $TabScreenCopyWith(TabScreen value, $Res Function(TabScreen) then) =
      _$TabScreenCopyWithImpl<$Res>;
  @override
  $Res call({Widget child, String title, Icon icon});
}

/// @nodoc
class _$TabScreenCopyWithImpl<$Res> extends _$TabsPageCopyWithImpl<$Res>
    implements $TabScreenCopyWith<$Res> {
  _$TabScreenCopyWithImpl(TabScreen _value, $Res Function(TabScreen) _then)
      : super(_value, (v) => _then(v as TabScreen));

  @override
  TabScreen get _value => super._value as TabScreen;

  @override
  $Res call({
    Object child = freezed,
    Object title = freezed,
    Object icon = freezed,
  }) {
    return _then(TabScreen(
      child == freezed ? _value.child : child as Widget,
      title: title == freezed ? _value.title : title as String,
      icon: icon == freezed ? _value.icon : icon as Icon,
    ));
  }
}

/// @nodoc
class _$TabScreen implements TabScreen {
  const _$TabScreen(this.child, {@required this.title, this.icon})
      : assert(child != null),
        assert(title != null);

  @override
  final Widget child;
  @override
  final String title;
  @override
  final Icon icon;

  @override
  String toString() {
    return 'TabsPage(child: $child, title: $title, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TabScreen &&
            (identical(other.child, child) ||
                const DeepCollectionEquality().equals(other.child, child)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(child) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(icon);

  @override
  $TabScreenCopyWith<TabScreen> get copyWith =>
      _$TabScreenCopyWithImpl<TabScreen>(this, _$identity);
}

abstract class TabScreen implements TabsPage {
  const factory TabScreen(Widget child, {@required String title, Icon icon}) =
      _$TabScreen;

  @override
  Widget get child;
  @override
  String get title;
  @override
  Icon get icon;
  @override
  $TabScreenCopyWith<TabScreen> get copyWith;
}

/// @nodoc
class _$ScreenTabsStateTearOff {
  const _$ScreenTabsStateTearOff();

// ignore: unused_element
  _ScreenTabsInitial initial() {
    return const _ScreenTabsInitial();
  }

// ignore: unused_element
  _ScreenTabChanged changed({int index}) {
    return _ScreenTabChanged(
      index: index,
    );
  }

// ignore: unused_element
  _ScreenTabsLoaded loaded(TabsPage page) {
    return _ScreenTabsLoaded(
      page,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ScreenTabsState = _$ScreenTabsStateTearOff();

/// @nodoc
mixin _$ScreenTabsState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult changed(int index),
    @required TResult loaded(TabsPage page),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult changed(int index),
    TResult loaded(TabsPage page),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ScreenTabsInitial value),
    @required TResult changed(_ScreenTabChanged value),
    @required TResult loaded(_ScreenTabsLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ScreenTabsInitial value),
    TResult changed(_ScreenTabChanged value),
    TResult loaded(_ScreenTabsLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ScreenTabsStateCopyWith<$Res> {
  factory $ScreenTabsStateCopyWith(
          ScreenTabsState value, $Res Function(ScreenTabsState) then) =
      _$ScreenTabsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScreenTabsStateCopyWithImpl<$Res>
    implements $ScreenTabsStateCopyWith<$Res> {
  _$ScreenTabsStateCopyWithImpl(this._value, this._then);

  final ScreenTabsState _value;
  // ignore: unused_field
  final $Res Function(ScreenTabsState) _then;
}

/// @nodoc
abstract class _$ScreenTabsInitialCopyWith<$Res> {
  factory _$ScreenTabsInitialCopyWith(
          _ScreenTabsInitial value, $Res Function(_ScreenTabsInitial) then) =
      __$ScreenTabsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$ScreenTabsInitialCopyWithImpl<$Res>
    extends _$ScreenTabsStateCopyWithImpl<$Res>
    implements _$ScreenTabsInitialCopyWith<$Res> {
  __$ScreenTabsInitialCopyWithImpl(
      _ScreenTabsInitial _value, $Res Function(_ScreenTabsInitial) _then)
      : super(_value, (v) => _then(v as _ScreenTabsInitial));

  @override
  _ScreenTabsInitial get _value => super._value as _ScreenTabsInitial;
}

/// @nodoc
class _$_ScreenTabsInitial implements _ScreenTabsInitial {
  const _$_ScreenTabsInitial();

  @override
  String toString() {
    return 'ScreenTabsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ScreenTabsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult changed(int index),
    @required TResult loaded(TabsPage page),
  }) {
    assert(initial != null);
    assert(changed != null);
    assert(loaded != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult changed(int index),
    TResult loaded(TabsPage page),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ScreenTabsInitial value),
    @required TResult changed(_ScreenTabChanged value),
    @required TResult loaded(_ScreenTabsLoaded value),
  }) {
    assert(initial != null);
    assert(changed != null);
    assert(loaded != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ScreenTabsInitial value),
    TResult changed(_ScreenTabChanged value),
    TResult loaded(_ScreenTabsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ScreenTabsInitial implements ScreenTabsState {
  const factory _ScreenTabsInitial() = _$_ScreenTabsInitial;
}

/// @nodoc
abstract class _$ScreenTabChangedCopyWith<$Res> {
  factory _$ScreenTabChangedCopyWith(
          _ScreenTabChanged value, $Res Function(_ScreenTabChanged) then) =
      __$ScreenTabChangedCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$ScreenTabChangedCopyWithImpl<$Res>
    extends _$ScreenTabsStateCopyWithImpl<$Res>
    implements _$ScreenTabChangedCopyWith<$Res> {
  __$ScreenTabChangedCopyWithImpl(
      _ScreenTabChanged _value, $Res Function(_ScreenTabChanged) _then)
      : super(_value, (v) => _then(v as _ScreenTabChanged));

  @override
  _ScreenTabChanged get _value => super._value as _ScreenTabChanged;

  @override
  $Res call({
    Object index = freezed,
  }) {
    return _then(_ScreenTabChanged(
      index: index == freezed ? _value.index : index as int,
    ));
  }
}

/// @nodoc
class _$_ScreenTabChanged implements _ScreenTabChanged {
  const _$_ScreenTabChanged({this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'ScreenTabsState.changed(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ScreenTabChanged &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @override
  _$ScreenTabChangedCopyWith<_ScreenTabChanged> get copyWith =>
      __$ScreenTabChangedCopyWithImpl<_ScreenTabChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult changed(int index),
    @required TResult loaded(TabsPage page),
  }) {
    assert(initial != null);
    assert(changed != null);
    assert(loaded != null);
    return changed(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult changed(int index),
    TResult loaded(TabsPage page),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changed != null) {
      return changed(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ScreenTabsInitial value),
    @required TResult changed(_ScreenTabChanged value),
    @required TResult loaded(_ScreenTabsLoaded value),
  }) {
    assert(initial != null);
    assert(changed != null);
    assert(loaded != null);
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ScreenTabsInitial value),
    TResult changed(_ScreenTabChanged value),
    TResult loaded(_ScreenTabsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class _ScreenTabChanged implements ScreenTabsState {
  const factory _ScreenTabChanged({int index}) = _$_ScreenTabChanged;

  int get index;
  _$ScreenTabChangedCopyWith<_ScreenTabChanged> get copyWith;
}

/// @nodoc
abstract class _$ScreenTabsLoadedCopyWith<$Res> {
  factory _$ScreenTabsLoadedCopyWith(
          _ScreenTabsLoaded value, $Res Function(_ScreenTabsLoaded) then) =
      __$ScreenTabsLoadedCopyWithImpl<$Res>;
  $Res call({TabsPage page});

  $TabsPageCopyWith<$Res> get page;
}

/// @nodoc
class __$ScreenTabsLoadedCopyWithImpl<$Res>
    extends _$ScreenTabsStateCopyWithImpl<$Res>
    implements _$ScreenTabsLoadedCopyWith<$Res> {
  __$ScreenTabsLoadedCopyWithImpl(
      _ScreenTabsLoaded _value, $Res Function(_ScreenTabsLoaded) _then)
      : super(_value, (v) => _then(v as _ScreenTabsLoaded));

  @override
  _ScreenTabsLoaded get _value => super._value as _ScreenTabsLoaded;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(_ScreenTabsLoaded(
      page == freezed ? _value.page : page as TabsPage,
    ));
  }

  @override
  $TabsPageCopyWith<$Res> get page {
    if (_value.page == null) {
      return null;
    }
    return $TabsPageCopyWith<$Res>(_value.page, (value) {
      return _then(_value.copyWith(page: value));
    });
  }
}

/// @nodoc
class _$_ScreenTabsLoaded implements _ScreenTabsLoaded {
  const _$_ScreenTabsLoaded(this.page) : assert(page != null);

  @override
  final TabsPage page;

  @override
  String toString() {
    return 'ScreenTabsState.loaded(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ScreenTabsLoaded &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @override
  _$ScreenTabsLoadedCopyWith<_ScreenTabsLoaded> get copyWith =>
      __$ScreenTabsLoadedCopyWithImpl<_ScreenTabsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult changed(int index),
    @required TResult loaded(TabsPage page),
  }) {
    assert(initial != null);
    assert(changed != null);
    assert(loaded != null);
    return loaded(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult changed(int index),
    TResult loaded(TabsPage page),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ScreenTabsInitial value),
    @required TResult changed(_ScreenTabChanged value),
    @required TResult loaded(_ScreenTabsLoaded value),
  }) {
    assert(initial != null);
    assert(changed != null);
    assert(loaded != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ScreenTabsInitial value),
    TResult changed(_ScreenTabChanged value),
    TResult loaded(_ScreenTabsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _ScreenTabsLoaded implements ScreenTabsState {
  const factory _ScreenTabsLoaded(TabsPage page) = _$_ScreenTabsLoaded;

  TabsPage get page;
  _$ScreenTabsLoadedCopyWith<_ScreenTabsLoaded> get copyWith;
}
