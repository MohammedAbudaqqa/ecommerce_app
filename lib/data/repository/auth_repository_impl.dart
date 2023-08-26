import 'package:dartz/dartz.dart';
import 'package:ecommerce_audio/core/errors/failure.dart';
import 'package:ecommerce_audio/domain/repositories.dart' show AuthRepository;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  late GlobalKey formKey = GlobalKey<FormState>();

  @override
  Future<Either<Failure, UserCredential>> login(
      {required String email,
      required String password,
      required GlobalKey<FormState> formKey}) async {
    if (formKey.currentState == null) {
      print("_formKey.currentState is null!");
    } else if (formKey.currentState!.validate()) {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user!.uid.isNotEmpty) {
          prefs.setBool("isLoggedIn", true);
        } else {
          prefs.setBool("isLoggedIn", false);
        }

        print(userCredential.user!.uid);
        if (userCredential.user!.email != null) {
          right(userCredential);
          return Right(userCredential);
        }
        print("login using email and password success");
        return right(userCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          return Left(ServerFailure("user-not-found "));
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          return Left(ServerFailure("wrong-password "));
        }
        //  return Left(ServerFailure("Some thing Wrong "));
      }
    }
    return Left(ServerFailure(" Please Enter user email and password "));
  }

  @override
  Future<Either<Failure, UserCredential>> siginUp(
      {required String email,
      required String password,
      required GlobalKey<FormState> formKey}) async {
    if (formKey.currentState == null) {
      print("_formKey.currentState is null!");
    } else if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        return Right(userCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          return Left(ServerFailure("weak-password "));
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          return Left(
              ServerFailure("The account already exists for that email "));
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return Left(ServerFailure(
        "Some thing wrong with creating account please try again"));
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    print(
        "========================================================================================");

    print(credential);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future logOut() async {
    // final User? user = FirebaseAuth.instance.currentUser;
    //   final email = user!.email;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("isLoggedIn", false);
    prefs.clear();
    prefs.remove("isLoggedIn");
    await FirebaseAuth.instance.signOut();
    print("logOut Successfully");
  }
}
