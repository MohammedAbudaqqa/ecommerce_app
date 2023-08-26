import 'package:ecommerce_audio/controllers/cubit/auth_cubit.dart';
import 'package:ecommerce_audio/core/functions/show_snackbar.dart';
import 'package:ecommerce_audio/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_audio/features/auth/presentaion/view/widgets/custome_signin.dart';
import 'package:ecommerce_audio/features/auth/presentaion/view/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_button.dart';

class SiginUp extends StatelessWidget {
  const SiginUp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/bg.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: SizedBox(
                // width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: formKey,
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Spacer(flex: 2),
                          const Text(
                            "Audio",
                            style: TextStyle(
                                fontSize: 51,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "It's modular and designed to last",
                            style: Styles.textStyle14,
                          ),
                          const Spacer(flex: 3),
                          CustomTextFormField(
                            controller: email,
                            validator: (value) {
                              RegExp regExp = RegExp(
                                  r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (!regExp.hasMatch(value!)) {
                                return "Please Make sure you enter the right Email Format";
                              }
                              if (value.isEmpty) {
                                return "please Enter Password";
                              }
                              return null;
                            },
                            hintText: "Email",
                            prefixIcon: Icons.email_outlined,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              controller: password,
                              validator: (value) {
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                                if (value!.length <= 6) {
                                  return "Please Enter longer password";
                                }
                                if (!regex.hasMatch(value)) {
                                  return "Please Make your password contain :\nat least one upper case\nat least one lower case\n at least one digit\nat least one Special character";
                                }
                                if (value.isEmpty) {
                                  return "please Enter Password";
                                }
                                return null;
                              },
                              hintText: "Password",
                              prefixIcon: Icons.lock_outline,
                              isObscure: true),
                          const SizedBox(
                            height: 20,
                          ),
                          //TODO
                          BlocListener<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthSuccess) {
                                showSnackBar(
                                    context, "Account created Successfully");
                              } else {}
                            },
                            child: CustomButton(
                              buttonText: "Sign Up",
                              function: () async {
                                context.read<AuthCubit>().siginUp(
                                    email: email.text,
                                    password: password.text,
                                    formKey: formKey);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 42,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // CustomSignin(
                              //   function: () {},
                              //   icon: Icons.apple,
                              // ),
                              // CustomSignin(
                              //   function: () {
                              //     // signInWithFacebook();
                              //   },
                              //   icon: Icons.facebook,
                              // ),
                              CustomSignin(
                                function: () async {
                                  try {
                                    //   await signInWithGoogle();
                                    await AuthRepositoryImpl()
                                        .signInWithGoogle();
                                    context.go("/HomeView");
                                  } on Exception catch (e) {
                                    print(e.toString());
                                  }
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "If you have an account ?",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                child: const Text(
                                  "Sign In here",
                                  style: TextStyle(
                                    decorationColor: Color(0xff0ACF83),
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff0ACF83),
                                  ),
                                ),
                                onPressed: () {
                                  context.go("/");
                                },
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Future authStateChanges() async {
//   FirebaseAuth.instance.authStateChanges().listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   });
// }

// Future sendPassword() async {
//   final User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     final email = user.email;

//     await FirebaseAuth.instance.sendPasswordResetEmail(email: email as String);
//   }
// }

// Future logOut() async {
//   // final User? user = FirebaseAuth.instance.currentUser;
//   //   final email = user!.email;

//   await FirebaseAuth.instance.signOut();
//   print("logOut Successfully");
// }
