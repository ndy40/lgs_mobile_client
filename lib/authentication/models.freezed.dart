// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Email _$EmailFromJson(Map<String, dynamic> json) {
  return _Email.fromJson(json);
}

/// @nodoc
class _$EmailTearOff {
  const _$EmailTearOff();

// ignore: unused_element
  _Email call({@required String email}) {
    return _Email(
      email: email,
    );
  }

// ignore: unused_element
  Email fromJson(Map<String, Object> json) {
    return Email.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Email = _$EmailTearOff();

/// @nodoc
mixin _$Email {
  String get email;

  Map<String, dynamic> toJson();
  $EmailCopyWith<Email> get copyWith;
}

/// @nodoc
abstract class $EmailCopyWith<$Res> {
  factory $EmailCopyWith(Email value, $Res Function(Email) then) =
      _$EmailCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$EmailCopyWithImpl<$Res> implements $EmailCopyWith<$Res> {
  _$EmailCopyWithImpl(this._value, this._then);

  final Email _value;
  // ignore: unused_field
  final $Res Function(Email) _then;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
abstract class _$EmailCopyWith<$Res> implements $EmailCopyWith<$Res> {
  factory _$EmailCopyWith(_Email value, $Res Function(_Email) then) =
      __$EmailCopyWithImpl<$Res>;
  @override
  $Res call({String email});
}

/// @nodoc
class __$EmailCopyWithImpl<$Res> extends _$EmailCopyWithImpl<$Res>
    implements _$EmailCopyWith<$Res> {
  __$EmailCopyWithImpl(_Email _value, $Res Function(_Email) _then)
      : super(_value, (v) => _then(v as _Email));

  @override
  _Email get _value => super._value as _Email;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(_Email(
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Email with DiagnosticableTreeMixin implements _Email {
  _$_Email({@required this.email}) : assert(email != null);

  factory _$_Email.fromJson(Map<String, dynamic> json) =>
      _$_$_EmailFromJson(json);

  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Email(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Email'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Email &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$EmailCopyWith<_Email> get copyWith =>
      __$EmailCopyWithImpl<_Email>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EmailToJson(this);
  }
}

abstract class _Email implements Email {
  factory _Email({@required String email}) = _$_Email;

  factory _Email.fromJson(Map<String, dynamic> json) = _$_Email.fromJson;

  @override
  String get email;
  @override
  _$EmailCopyWith<_Email> get copyWith;
}

Login _$LoginFromJson(Map<String, dynamic> json) {
  return _Login.fromJson(json);
}

/// @nodoc
class _$LoginTearOff {
  const _$LoginTearOff();

// ignore: unused_element
  _Login call({@JsonKey(name: 'username') String email, String password}) {
    return _Login(
      email: email,
      password: password,
    );
  }

// ignore: unused_element
  Login fromJson(Map<String, Object> json) {
    return Login.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Login = _$LoginTearOff();

/// @nodoc
mixin _$Login {
  @JsonKey(name: 'username')
  String get email;
  String get password;

  Map<String, dynamic> toJson();
  $LoginCopyWith<Login> get copyWith;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'username') String email, String password});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res> implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(this._value, this._then);

  final Login _value;
  // ignore: unused_field
  final $Res Function(Login) _then;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginCopyWith<$Res> implements $LoginCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) then) =
      __$LoginCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'username') String email, String password});
}

/// @nodoc
class __$LoginCopyWithImpl<$Res> extends _$LoginCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(_Login _value, $Res Function(_Login) _then)
      : super(_value, (v) => _then(v as _Login));

  @override
  _Login get _value => super._value as _Login;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_Login(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Login with DiagnosticableTreeMixin implements _Login {
  const _$_Login({@JsonKey(name: 'username') this.email, this.password});

  factory _$_Login.fromJson(Map<String, dynamic> json) =>
      _$_$_LoginFromJson(json);

  @override
  @JsonKey(name: 'username')
  final String email;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Login(email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Login'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Login &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$LoginCopyWith<_Login> get copyWith =>
      __$LoginCopyWithImpl<_Login>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LoginToJson(this);
  }
}

abstract class _Login implements Login {
  const factory _Login(
      {@JsonKey(name: 'username') String email, String password}) = _$_Login;

  factory _Login.fromJson(Map<String, dynamic> json) = _$_Login.fromJson;

  @override
  @JsonKey(name: 'username')
  String get email;
  @override
  String get password;
  @override
  _$LoginCopyWith<_Login> get copyWith;
}

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
class _$TokenTearOff {
  const _$TokenTearOff();

// ignore: unused_element
  _Token call(
      {String token, @JsonKey(name: 'refresh_token') String refreshToken}) {
    return _Token(
      token: token,
      refreshToken: refreshToken,
    );
  }

// ignore: unused_element
  Token fromJson(Map<String, Object> json) {
    return Token.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Token = _$TokenTearOff();

/// @nodoc
mixin _$Token {
  String get token;
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  Map<String, dynamic> toJson();
  $TokenCopyWith<Token> get copyWith;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res>;
  $Res call(
      {String token, @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res> implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  final Token _value;
  // ignore: unused_field
  final $Res Function(Token) _then;

  @override
  $Res call({
    Object token = freezed,
    Object refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed ? _value.token : token as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
    ));
  }
}

/// @nodoc
abstract class _$TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$TokenCopyWith(_Token value, $Res Function(_Token) then) =
      __$TokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {String token, @JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class __$TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res>
    implements _$TokenCopyWith<$Res> {
  __$TokenCopyWithImpl(_Token _value, $Res Function(_Token) _then)
      : super(_value, (v) => _then(v as _Token));

  @override
  _Token get _value => super._value as _Token;

  @override
  $Res call({
    Object token = freezed,
    Object refreshToken = freezed,
  }) {
    return _then(_Token(
      token: token == freezed ? _value.token : token as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Token with DiagnosticableTreeMixin implements _Token {
  const _$_Token(
      {this.token, @JsonKey(name: 'refresh_token') this.refreshToken});

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$_$_TokenFromJson(json);

  @override
  final String token;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Token(token: $token, refreshToken: $refreshToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Token'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('refreshToken', refreshToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Token &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(refreshToken);

  @override
  _$TokenCopyWith<_Token> get copyWith =>
      __$TokenCopyWithImpl<_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TokenToJson(this);
  }
}

abstract class _Token implements Token {
  const factory _Token(
      {String token,
      @JsonKey(name: 'refresh_token') String refreshToken}) = _$_Token;

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override
  String get token;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  _$TokenCopyWith<_Token> get copyWith;
}

RefreshToken _$RefreshTokenFromJson(Map<String, dynamic> json) {
  return _RefreshToken.fromJson(json);
}

/// @nodoc
class _$RefreshTokenTearOff {
  const _$RefreshTokenTearOff();

// ignore: unused_element
  _RefreshToken call({@JsonKey(name: 'refresh_token') String refreshToken}) {
    return _RefreshToken(
      refreshToken: refreshToken,
    );
  }

// ignore: unused_element
  RefreshToken fromJson(Map<String, Object> json) {
    return RefreshToken.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RefreshToken = _$RefreshTokenTearOff();

/// @nodoc
mixin _$RefreshToken {
  @JsonKey(name: 'refresh_token')
  String get refreshToken;

  Map<String, dynamic> toJson();
  $RefreshTokenCopyWith<RefreshToken> get copyWith;
}

/// @nodoc
abstract class $RefreshTokenCopyWith<$Res> {
  factory $RefreshTokenCopyWith(
          RefreshToken value, $Res Function(RefreshToken) then) =
      _$RefreshTokenCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class _$RefreshTokenCopyWithImpl<$Res> implements $RefreshTokenCopyWith<$Res> {
  _$RefreshTokenCopyWithImpl(this._value, this._then);

  final RefreshToken _value;
  // ignore: unused_field
  final $Res Function(RefreshToken) _then;

  @override
  $Res call({
    Object refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
    ));
  }
}

/// @nodoc
abstract class _$RefreshTokenCopyWith<$Res>
    implements $RefreshTokenCopyWith<$Res> {
  factory _$RefreshTokenCopyWith(
          _RefreshToken value, $Res Function(_RefreshToken) then) =
      __$RefreshTokenCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'refresh_token') String refreshToken});
}

/// @nodoc
class __$RefreshTokenCopyWithImpl<$Res> extends _$RefreshTokenCopyWithImpl<$Res>
    implements _$RefreshTokenCopyWith<$Res> {
  __$RefreshTokenCopyWithImpl(
      _RefreshToken _value, $Res Function(_RefreshToken) _then)
      : super(_value, (v) => _then(v as _RefreshToken));

  @override
  _RefreshToken get _value => super._value as _RefreshToken;

  @override
  $Res call({
    Object refreshToken = freezed,
  }) {
    return _then(_RefreshToken(
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RefreshToken with DiagnosticableTreeMixin implements _RefreshToken {
  _$_RefreshToken({@JsonKey(name: 'refresh_token') this.refreshToken});

  factory _$_RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$_$_RefreshTokenFromJson(json);

  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RefreshToken(refreshToken: $refreshToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RefreshToken'))
      ..add(DiagnosticsProperty('refreshToken', refreshToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RefreshToken &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(refreshToken);

  @override
  _$RefreshTokenCopyWith<_RefreshToken> get copyWith =>
      __$RefreshTokenCopyWithImpl<_RefreshToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RefreshTokenToJson(this);
  }
}

abstract class _RefreshToken implements RefreshToken {
  factory _RefreshToken({@JsonKey(name: 'refresh_token') String refreshToken}) =
      _$_RefreshToken;

  factory _RefreshToken.fromJson(Map<String, dynamic> json) =
      _$_RefreshToken.fromJson;

  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  _$RefreshTokenCopyWith<_RefreshToken> get copyWith;
}
