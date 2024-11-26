part of 'basic_auth_bloc.dart';

enum FormStatus { initial, pending, success, error}

@immutable

final class BasicAuthState {
  final String email;
  final String password;
  final FormStatus formStatus;
  final String? errorMessage;

  BasicAuthState({this.email='', this.password='', this.formStatus=FormStatus.initial, this.errorMessage});

  BasicAuthState copyWith({String? email, String? password, FormStatus? formStatus, String? errorMessage}) {
    return BasicAuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

