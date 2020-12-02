// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'screen_tabs_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ScreenTabsEventTearOff {
  const _$ScreenTabsEventTearOff();

// ignore: unused_element
  _ScreenTabsEventInitial initial() {
    return const _ScreenTabsEventInitial();
  }

// ignore: unused_element
  _ScreenTabChanged tabChanged({int index = 0}) {
    return _ScreenTabChanged(
      index: index,
    );
  }

// ignore: unused_element
  _ScreenTabLoaded tabLoaded() {
    return const _ScreenTabLoaded();
  }
}

/// @nodoc
// ignore: unused_element
const $ScreenTabsEvent = _$ScreenTabsEventTearOff();

/// @nodoc
mixin _$ScreenTabsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult tabChanged(int index),
    @required TResult tabLoaded(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult tabChanged(int index),
    TResult tabLoaded(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ScreenTabsEventInitial value),
    @required TResult tabChanged(_ScreenTabChanged value),
    @required TResult tabLoaded(_ScreenTabLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ScreenTabsEventInitial value),
    TResult tabChanged(_ScreenTabChanged value),
    TResult tabLoaded(_ScreenTabLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ScreenTabsEventCopyWith<$Res> {
  factory $ScreenTabsEventCopyWith(
          ScreenTabsEvent value, $Res Function(ScreenTabsEvent) then) =
      _$ScreenTabsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScreenTabsEventCopyWithImpl<$Res>
    implements $ScreenTabsEventCopyWith<$Res> {
  _$ScreenTabsEventCopyWithImpl(this._value, this._then);

  final ScreenTabsEvent _value;
  // ignore: unused_field
  final $Res Function(ScreenTabsEvent) _then;
}

/// @nodoc
abstract class _$ScreenTabsEventInitialCopyWith<$Res> {
  factory _$ScreenTabsEventInitialCopyWith(_ScreenTabsEventInitial value,
          $Res Function(_ScreenTabsEventInitial) then) =
      __$ScreenTabsEventInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$ScreenTabsEventInitialCopyWithImpl<$Res>
    extends _$ScreenTabsEventCopyWithImpl<$Res>
    implements _$ScreenTabsEventInitialCopyWith<$Res> {
  __$ScreenTabsEventInitialCopyWithImpl(_ScreenTabsEventInitial _value,
      $Res Function(_ScreenTabsEventInitial) _then)
      : super(_value, (v) => _then(v as _ScreenTabsEventInitial));

  @override
  _ScreenTabsEventInitial get _value => super._value as _ScreenTabsEventInitial;
}

/// @nodoc
class _$_ScreenTabsEventInitial implements _ScreenTabsEventInitial {
  const _$_ScreenTabsEventInitial();

  @override
  String toString() {
    return 'ScreenTabsEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ScreenTabsEventInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult tabChanged(int index),
    @required TResult tabLoaded(),
  }) {
    assert(initial != null);
    assert(tabChanged != null);
    assert(tabLoaded != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult tabChanged(int index),
    TResult tabLoaded(),
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
    @required TResult initial(_ScreenTabsEventInitial value),
    @required TResult tabChanged(_ScreenTabChanged value),
    @required TResult tabLoaded(_ScreenTabLoaded value),
  }) {
    assert(initial != null);
    assert(tabChanged != null);
    assert(tabLoaded != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ScreenTabsEventInitial value),
    TResult tabChanged(_ScreenTabChanged value),
    TResult tabLoaded(_ScreenTabLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ScreenTabsEventInitial implements ScreenTabsEvent {
  const factory _ScreenTabsEventInitial() = _$_ScreenTabsEventInitial;
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
    extends _$ScreenTabsEventCopyWithImpl<$Res>
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
  const _$_ScreenTabChanged({this.index = 0}) : assert(index != null);

  @JsonKey(defaultValue: 0)
  @override
  final int index;

  @override
  String toString() {
    return 'ScreenTabsEvent.tabChanged(index: $index)';
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
    @required TResult tabChanged(int index),
    @required TResult tabLoaded(),
  }) {
    assert(initial != null);
    assert(tabChanged != null);
    assert(tabLoaded != null);
    return tabChanged(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult tabChanged(int index),
    TResult tabLoaded(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (tabChanged != null) {
      return tabChanged(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ScreenTabsEventInitial value),
    @required TResult tabChanged(_ScreenTabChanged value),
    @required TResult tabLoaded(_ScreenTabLoaded value),
  }) {
    assert(initial != null);
    assert(tabChanged != null);
    assert(tabLoaded != null);
    return tabChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ScreenTabsEventInitial value),
    TResult tabChanged(_ScreenTabChanged value),
    TResult tabLoaded(_ScreenTabLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (tabChanged != null) {
      return tabChanged(this);
    }
    return orElse();
  }
}

abstract class _ScreenTabChanged implements ScreenTabsEvent {
  const factory _ScreenTabChanged({int index}) = _$_ScreenTabChanged;

  int get index;
  _$ScreenTabChangedCopyWith<_ScreenTabChanged> get copyWith;
}

/// @nodoc
abstract class _$ScreenTabLoadedCopyWith<$Res> {
  factory _$ScreenTabLoadedCopyWith(
          _ScreenTabLoaded value, $Res Function(_ScreenTabLoaded) then) =
      __$ScreenTabLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ScreenTabLoadedCopyWithImpl<$Res>
    extends _$ScreenTabsEventCopyWithImpl<$Res>
    implements _$ScreenTabLoadedCopyWith<$Res> {
  __$ScreenTabLoadedCopyWithImpl(
      _ScreenTabLoaded _value, $Res Function(_ScreenTabLoaded) _then)
      : super(_value, (v) => _then(v as _ScreenTabLoaded));

  @override
  _ScreenTabLoaded get _value => super._value as _ScreenTabLoaded;
}

/// @nodoc
class _$_ScreenTabLoaded implements _ScreenTabLoaded {
  const _$_ScreenTabLoaded();

  @override
  String toString() {
    return 'ScreenTabsEvent.tabLoaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ScreenTabLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult tabChanged(int index),
    @required TResult tabLoaded(),
  }) {
    assert(initial != null);
    assert(tabChanged != null);
    assert(tabLoaded != null);
    return tabLoaded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult tabChanged(int index),
    TResult tabLoaded(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (tabLoaded != null) {
      return tabLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ScreenTabsEventInitial value),
    @required TResult tabChanged(_ScreenTabChanged value),
    @required TResult tabLoaded(_ScreenTabLoaded value),
  }) {
    assert(initial != null);
    assert(tabChanged != null);
    assert(tabLoaded != null);
    return tabLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ScreenTabsEventInitial value),
    TResult tabChanged(_ScreenTabChanged value),
    TResult tabLoaded(_ScreenTabLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (tabLoaded != null) {
      return tabLoaded(this);
    }
    return orElse();
  }
}

abstract class _ScreenTabLoaded implements ScreenTabsEvent {
  const factory _ScreenTabLoaded() = _$_ScreenTabLoaded;
}
