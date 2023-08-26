import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/repository/auth_repository_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepositoryImpl) : super(AuthInitial());
  final AuthRepositoryImpl authRepositoryImpl;
  Future<void> login(
      {required String email,
      required String password,
      required GlobalKey<FormState> formKey}) async {
    emit(AuthLoading());

    var result = await authRepositoryImpl.login(
        email: email, password: password, formKey: formKey);
    result.fold((l) {
      emit(AuthFailure(l.errMessage));
    }, (r) {
      emit(AuthSuccess());
    });
  }

  Future<void> siginUp(
      {required String email,
      required String password,
      required GlobalKey<FormState> formKey}) async {
    var result1 = await authRepositoryImpl.siginUp(
        email: email, password: password, formKey: formKey);
    result1.fold((l) {
      emit(AuthFailure(l.errMessage));
    }, (r) {
      emit(AuthSuccess());
    });
  }
}
