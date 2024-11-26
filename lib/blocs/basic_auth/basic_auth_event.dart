part of 'basic_auth_bloc.dart';

@immutable
sealed class BasicAuthEvent{}

final class EmailChanged extends BasicAuthEvent{
  final String email;

  EmailChanged(this.email);
}

final class PasswordChanged extends BasicAuthEvent{
  final String password;

  PasswordChanged(this.password);
}

final class FormSubmitted extends BasicAuthEvent{}

