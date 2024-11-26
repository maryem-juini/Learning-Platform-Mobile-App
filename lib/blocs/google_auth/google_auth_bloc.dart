import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learningplatform/repos/auth_repo.dart';

part 'google_auth_event.dart';
part 'google_auth_state.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  GoogleAuthBloc(this._authRepo) : super(GoogleAuthInitial()) {
    on<SignInEvent>(_signInWithGoogle);
  }

  final AuthRepo _authRepo;

  Future<void> _signInWithGoogle(SignInEvent event, Emitter<GoogleAuthState> emit) async {
    emit(GoogleAuthPending());
    final user = await _authRepo.signInWithGoogle();
    if (user != null) {
      emit(GoogleAuthSuccess());
    } else {
      emit(GoogleAuthError());
    }
  } 
}
