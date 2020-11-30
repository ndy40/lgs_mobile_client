import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;
import 'package:lgs_mobile_client/authentication/exceptions.dart';
import 'package:lgs_mobile_client/authentication/models.dart';
import 'package:lgs_mobile_client/authentication/repositories.dart';
import 'package:lgs_mobile_client/authentication/services.dart';
import 'package:lgs_mobile_client/common/services.dart';

import '../models.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _service;

  final userPref = getx.Get.find<UserPreferenceService>();

  AuthenticationBloc(this._service)
      : assert(_service != null),
        super(const AuthenticationUnknownState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStateChanged) {
      yield* _mapAuthenticationStateChangedToState(event);
    } else {
      yield state;
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStateChangedToState(AuthenticationStateChanged event) async* {
    if (event.status is AuthenticationUnknownState) {
      yield* _attemptLogin();
    } else {
      yield event.status;
    }
  }

  Stream<AuthenticationState> _attemptLogin() async* {
    try {
      if (state is AuthenticationUnknownState) {
        final Token token = await userPref.getToken();

        if (tokenIsValid(token)) {
          yield AuthenticatedState(token: token);
          this.add(AuthenticationStateChanged(status: AuthenticatedState(token: token)));
        } else if (!token.token.isNullOrBlank) {
          userPref.removeToken();

          final Response<Token> response = await _service
              .refreshToken(RefreshToken(refreshToken: token.refreshToken));
          yield AuthenticatedState(token: response.body);
          this.add(AuthenticationStateChanged(status: AuthenticatedState(token: response.body)));
        } else {
          yield UnAuthenticatedState();
          this.add(AuthenticationStateChanged(status: UnAuthenticatedState()));
        }
      }
    } catch (e) {
      yield UnAuthenticatedState();
      this.add(AuthenticationStateChanged(status: UnAuthenticatedState()));
    }
  }
}


class LoginCubit extends Cubit<LoginState> {

  final AuthService _service;

  LoginCubit(this._service): super(const LoginState(login: Login()));

  void emailUpdated(String email) {
    print('email update');
    emit(state.copyWith(login: state.login.copyWith(email: email)));
  }
  
  void passwordUpdated(String password) {
    print('password update');
    emit(state.copyWith(login: state.login.copyWith(password: password)));
  }

  Future<void> authenticate() async {
    try {
      emit(state.copyWith(state: LoginFormState.submissionInProgress));
      final Token authToken = await _service.authenticate(state.login);
      emit(state.copyWith(state: LoginFormState.success, token: authToken));
      emit(state.copyWith(state: LoginFormState.initial));
    }  on AuthenticationFailedException {
        emit(state.copyWith(state: LoginFormState.failure));
    }
  }
}