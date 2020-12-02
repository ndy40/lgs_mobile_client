import 'package:freezed_annotation/freezed_annotation.dart';

part 'signout_state.freezed.dart';

@freezed
abstract class SignoutState with _$SignoutState {
  const factory SignoutState.initial() = _SignoutInitial;
  const factory SignoutState.signoutRequested() = _SignoutRequested;
  const factory SignoutState.signoutSuccess() = _SignoutSuccess;
  const factory SignoutState.error({@required String message}) = SignoutError;
}