part of 'authentication_bloc.dart';

// authentication events
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStateChanged extends AuthenticationEvent {
  final AuthenticationState status;

  const AuthenticationStateChanged({this.status});

  @override
  List<Object> get props => [status];
}

// password reset events
abstract class PasswordResetEvent extends Equatable {
  const PasswordResetEvent();

  @override
  List<Object> get props => [];
}

class PasswordResetInitial extends PasswordResetEvent {}

class PasswordResetRequested extends PasswordResetEvent {
  final Email email;
  const PasswordResetRequested({this.email}) : assert(email != null);

  @override
  List<Object> get props => [email];
}

class PasswordResetEmailSent extends PasswordResetEvent {}

// registration events
abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationRequestInitial extends RegistrationEvent {}

class RegistrationRequested extends RegistrationEvent {
  final RegistrationModel model;
  const RegistrationRequested({@required this.model}) : assert(model != null);

  @override
  List<Object> get props => [model];
}

class RegistrationSuccessful extends RegistrationEvent {
  final User user;

  const RegistrationSuccessful({@required this.user}) : assert(user != null);

  @override
  List<Object> get props => [user];
}

class RegistrationError extends RegistrationEvent {
  final String message;
  const RegistrationError({@required this.message});

  @override
  List<Object> get props => [message];
}
