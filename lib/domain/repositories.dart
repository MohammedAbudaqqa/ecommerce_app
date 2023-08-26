import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/errors/failure.dart';
import '../data/models/models.dart';

abstract class AuthRepository {
  GlobalKey formKey = GlobalKey<FormState>();

  Future<Either<Failure, UserCredential>> login(
      {required String email,
      required String password,
      required GlobalKey<FormState> formKey});
  Future<Either<Failure, UserCredential>> siginUp(
      {required String email,
      required String password,
      required GlobalKey<FormState> formKey});
  Future<UserCredential> signInWithGoogle();
  Future logOut();
}

abstract class HomeRepository {
  Future<Either<Failure, List<Models>>> fetchAllProduct();
}
