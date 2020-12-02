part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {

  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthenticationState {
  final Token token;

  const AuthenticatedState({this.token});

  @override
  List<Object> get props => [token];
}

class UnAuthenticatedState extends AuthenticationState {
  const UnAuthenticatedState();
}

class AuthenticationUnknownState extends AuthenticationState {
  const AuthenticationUnknownState();
}

class AuthenticationFailedState extends AuthenticationState {
  final String message;

  const AuthenticationFailedState({@required this.message})
      : assert(message != null);

  @override
  List<Object> get props => [message];
}


enum LoginFormState {initial, submissionInProgress, success, failure}

class LoginState extends Equatable {

  final LoginFormState state;
  final Login login;
  final Token token;

  const LoginState({
    this.login,
    this.state = LoginFormState.initial,
    this.token
  });

  @override
  List<Object> get props => [state, login, token];

  LoginState copyWith({Login login, LoginFormState state, Token token}) {
    return LoginState( login: login ?? this.login,
      state: state ?? this.state,
      token: token ?? this.token
    );
  }
}


abstract class PasswordResetState {}

class PasswordResetStateInitial extends PasswordResetState {}

class PasswordResetEmailProvided extends PasswordResetState {}

abstract class RegistrationState {}

class RegistrationSuccessfulState extends Equatable
    implements RegistrationState {
  final User user;

  const RegistrationSuccessfulState({this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}

class RegistrationErrorState extends Equatable implements RegistrationState {
  final String message;

  const RegistrationErrorState({this.message})
      : assert(message != null || message != '');

  @override
  List<Object> get props => [message];
}
