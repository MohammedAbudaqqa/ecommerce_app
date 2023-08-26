import 'package:ecommerce_audio/controllers/cubit/auth_cubit.dart';
import 'package:ecommerce_audio/core/functions/show_snackbar.dart';
import 'package:ecommerce_audio/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_audio/features/auth/presentaion/view/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/style.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool isLoading = false;
    // void dispose() {
    //   emailController.dispose();
    //   passwordController.dispose();
    // }
    // Future<bool> isLogging(UserCredential userCredential) async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setString("uid", userCredential.user!.uid);

    //   if (prefs.getString("uid") != null) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // }

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          isLoading = false;
          context.go('/HomeView');
        } else if (state is AuthLoading) {
          isLoading = true;
        } else if (state is AuthFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/bg.png"),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: formKey,
                    child: LayoutBuilder(
                      builder: (context, constraints) => SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Spacer(flex: 1),
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
                                  controller: emailController,
                                  validator: (value) {
                                    RegExp regExp = RegExp(
                                        r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                    if (!regExp.hasMatch(value!)) {
                                      return "Please Make sure you enter the right Email";
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
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please Enter Password";
                                      }
                                      if (value.length <= 6) {
                                        return "Please Enter longer password";
                                      }
                                      if (value.isEmpty) {
                                        return "please Enter Password";
                                      }
                                      return null;
                                    },
                                    hintText: "Password",
                                    prefixIcon: Icons.lock_outline,
                                    isObscure: true),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password",
                                    style: Styles.textStyle14,
                                  ),
                                ),
                                CustomButton(
                                  buttonText: "Login",
                                  function: () async {
                                    isLoading = true;

                                    context.read<AuthCubit>().login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        formKey: formKey);
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Didn't have an account ?",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextButton(
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          decorationColor: Color(0xff0ACF83),
                                          decoration: TextDecoration.underline,
                                          color: Color(0xff0ACF83),
                                        ),
                                      ),
                                      onPressed: () {
                                        context.go("/SiginUp");
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
          ),
        );
      },
    );
  }
}
