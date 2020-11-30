// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shopping_list_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ShoppingListAddStateTearOff {
  const _$ShoppingListAddStateTearOff();

// ignore: unused_element
  _ShoppingListAddInitial initial() {
    return const _ShoppingListAddInitial();
  }

// ignore: unused_element
  _ShoppingListChanged shoppingListChanged(ShoppingList list) {
    return _ShoppingListChanged(
      list,
    );
  }

// ignore: unused_element
  _ShoppingListAddErrorState error({@required String message}) {
    return _ShoppingListAddErrorState(
      message: message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ShoppingListAddState = _$ShoppingListAddStateTearOff();

/// @nodoc
mixin _$ShoppingListAddState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult shoppingListChanged(ShoppingList list),
    @required TResult error(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult shoppingListChanged(ShoppingList list),
    TResult error(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ShoppingListAddInitial value),
    @required TResult shoppingListChanged(_ShoppingListChanged value),
    @required TResult error(_ShoppingListAddErrorState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ShoppingListAddInitial value),
    TResult shoppingListChanged(_ShoppingListChanged value),
    TResult error(_ShoppingListAddErrorState value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ShoppingListAddStateCopyWith<$Res> {
  factory $ShoppingListAddStateCopyWith(ShoppingListAddState value,
          $Res Function(ShoppingListAddState) then) =
      _$ShoppingListAddStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingListAddStateCopyWithImpl<$Res>
    implements $ShoppingListAddStateCopyWith<$Res> {
  _$ShoppingListAddStateCopyWithImpl(this._value, this._then);

  final ShoppingListAddState _value;
  // ignore: unused_field
  final $Res Function(ShoppingListAddState) _then;
}

/// @nodoc
abstract class _$ShoppingListAddInitialCopyWith<$Res> {
  factory _$ShoppingListAddInitialCopyWith(_ShoppingListAddInitial value,
          $Res Function(_ShoppingListAddInitial) then) =
      __$ShoppingListAddInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$ShoppingListAddInitialCopyWithImpl<$Res>
    extends _$ShoppingListAddStateCopyWithImpl<$Res>
    implements _$ShoppingListAddInitialCopyWith<$Res> {
  __$ShoppingListAddInitialCopyWithImpl(_ShoppingListAddInitial _value,
      $Res Function(_ShoppingListAddInitial) _then)
      : super(_value, (v) => _then(v as _ShoppingListAddInitial));

  @override
  _ShoppingListAddInitial get _value => super._value as _ShoppingListAddInitial;
}

/// @nodoc
class _$_ShoppingListAddInitial implements _ShoppingListAddInitial {
  const _$_ShoppingListAddInitial();

  @override
  String toString() {
    return 'ShoppingListAddState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ShoppingListAddInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult shoppingListChanged(ShoppingList list),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(shoppingListChanged != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult shoppingListChanged(ShoppingList list),
    TResult error(String message),
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
    @required TResult initial(_ShoppingListAddInitial value),
    @required TResult shoppingListChanged(_ShoppingListChanged value),
    @required TResult error(_ShoppingListAddErrorState value),
  }) {
    assert(initial != null);
    assert(shoppingListChanged != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ShoppingListAddInitial value),
    TResult shoppingListChanged(_ShoppingListChanged value),
    TResult error(_ShoppingListAddErrorState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ShoppingListAddInitial implements ShoppingListAddState {
  const factory _ShoppingListAddInitial() = _$_ShoppingListAddInitial;
}

/// @nodoc
abstract class _$ShoppingListChangedCopyWith<$Res> {
  factory _$ShoppingListChangedCopyWith(_ShoppingListChanged value,
          $Res Function(_ShoppingListChanged) then) =
      __$ShoppingListChangedCopyWithImpl<$Res>;
  $Res call({ShoppingList list});
}

/// @nodoc
class __$ShoppingListChangedCopyWithImpl<$Res>
    extends _$ShoppingListAddStateCopyWithImpl<$Res>
    implements _$ShoppingListChangedCopyWith<$Res> {
  __$ShoppingListChangedCopyWithImpl(
      _ShoppingListChanged _value, $Res Function(_ShoppingListChanged) _then)
      : super(_value, (v) => _then(v as _ShoppingListChanged));

  @override
  _ShoppingListChanged get _value => super._value as _ShoppingListChanged;

  @override
  $Res call({
    Object list = freezed,
  }) {
    return _then(_ShoppingListChanged(
      list == freezed ? _value.list : list as ShoppingList,
    ));
  }
}

/// @nodoc
class _$_ShoppingListChanged implements _ShoppingListChanged {
  const _$_ShoppingListChanged(this.list) : assert(list != null);

  @override
  final ShoppingList list;

  @override
  String toString() {
    return 'ShoppingListAddState.shoppingListChanged(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShoppingListChanged &&
            (identical(other.list, list) ||
                const DeepCollectionEquality().equals(other.list, list)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(list);

  @override
  _$ShoppingListChangedCopyWith<_ShoppingListChanged> get copyWith =>
      __$ShoppingListChangedCopyWithImpl<_ShoppingListChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult shoppingListChanged(ShoppingList list),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(shoppingListChanged != null);
    assert(error != null);
    return shoppingListChanged(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult shoppingListChanged(ShoppingList list),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (shoppingListChanged != null) {
      return shoppingListChanged(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ShoppingListAddInitial value),
    @required TResult shoppingListChanged(_ShoppingListChanged value),
    @required TResult error(_ShoppingListAddErrorState value),
  }) {
    assert(initial != null);
    assert(shoppingListChanged != null);
    assert(error != null);
    return shoppingListChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ShoppingListAddInitial value),
    TResult shoppingListChanged(_ShoppingListChanged value),
    TResult error(_ShoppingListAddErrorState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (shoppingListChanged != null) {
      return shoppingListChanged(this);
    }
    return orElse();
  }
}

abstract class _ShoppingListChanged implements ShoppingListAddState {
  const factory _ShoppingListChanged(ShoppingList list) =
      _$_ShoppingListChanged;

  ShoppingList get list;
  _$ShoppingListChangedCopyWith<_ShoppingListChanged> get copyWith;
}

/// @nodoc
abstract class _$ShoppingListAddErrorStateCopyWith<$Res> {
  factory _$ShoppingListAddErrorStateCopyWith(_ShoppingListAddErrorState value,
          $Res Function(_ShoppingListAddErrorState) then) =
      __$ShoppingListAddErrorStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ShoppingListAddErrorStateCopyWithImpl<$Res>
    extends _$ShoppingListAddStateCopyWithImpl<$Res>
    implements _$ShoppingListAddErrorStateCopyWith<$Res> {
  __$ShoppingListAddErrorStateCopyWithImpl(_ShoppingListAddErrorState _value,
      $Res Function(_ShoppingListAddErrorState) _then)
      : super(_value, (v) => _then(v as _ShoppingListAddErrorState));

  @override
  _ShoppingListAddErrorState get _value =>
      super._value as _ShoppingListAddErrorState;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_ShoppingListAddErrorState(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_ShoppingListAddErrorState implements _ShoppingListAddErrorState {
  const _$_ShoppingListAddErrorState({@required this.message})
      : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'ShoppingListAddState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShoppingListAddErrorState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$ShoppingListAddErrorStateCopyWith<_ShoppingListAddErrorState>
      get copyWith =>
          __$ShoppingListAddErrorStateCopyWithImpl<_ShoppingListAddErrorState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult shoppingListChanged(ShoppingList list),
    @required TResult error(String message),
  }) {
    assert(initial != null);
    assert(shoppingListChanged != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult shoppingListChanged(ShoppingList list),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_ShoppingListAddInitial value),
    @required TResult shoppingListChanged(_ShoppingListChanged value),
    @required TResult error(_ShoppingListAddErrorState value),
  }) {
    assert(initial != null);
    assert(shoppingListChanged != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_ShoppingListAddInitial value),
    TResult shoppingListChanged(_ShoppingListChanged value),
    TResult error(_ShoppingListAddErrorState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ShoppingListAddErrorState implements ShoppingListAddState {
  const factory _ShoppingListAddErrorState({@required String message}) =
      _$_ShoppingListAddErrorState;

  String get message;
  _$ShoppingListAddErrorStateCopyWith<_ShoppingListAddErrorState> get copyWith;
}
