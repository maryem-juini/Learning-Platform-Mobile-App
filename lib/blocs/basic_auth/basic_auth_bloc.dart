import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learningplatform/repos/auth_repo.dart';

part 'basic_auth_event.dart';
part 'basic_auth_state.dart';

class BasicAuthBloc extends Bloc<BasicAuthEvent, BasicAuthState> {
  BasicAuthBloc(Object object) : super(BasicAuthState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<FormSubmitted>(_formSubmitted);
  }

  final _authRepo = AuthRepo();

  void _emailChanged(EmailChanged event, Emitter<BasicAuthState> emit) {
    emit (state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChanged event, Emitter<BasicAuthState> emit) {
    emit (state.copyWith(password: event.password));
  }

  Future<void> _formSubmitted(FormSubmitted event, Emitter<BasicAuthState> emit) async {
    final email = state.email;
    final password = state.password;
    if (email.isEmpty || password.isEmpty) return;

    final user = await _authRepo.createUserWithEmailAndPassword(email, password);

    print('User : $user');
    if (user != null) {
      emit(state.copyWith(formStatus: FormStatus.success));
    } else {
      emit(state.copyWith(formStatus: FormStatus.error, errorMessage: 'Sign up failed'));
    }
  }
}
