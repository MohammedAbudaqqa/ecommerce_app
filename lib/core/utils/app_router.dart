import 'dart:ffi';

import 'package:ecommerce_audio/controllers/cubit/auth_cubit.dart';
import 'package:ecommerce_audio/core/utils/api_service.dart';
import 'package:ecommerce_audio/data/repository/home_repository_implement.dart';
import 'package:ecommerce_audio/features/auth/presentaion/view/siginup_view.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/explore_product.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/home_view.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/prodcut_details.dart';
import 'package:ecommerce_audio/features/home/presentaion/view/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../domain/repositories.dart';
import '../../features/auth/presentaion/view/login_view.dart';
import '../../features/home/presentaion/view/profile.dart';
import '../../features/home/presentaion/view/search_view.dart';
import '../../features/home/presentaion/view_models/cubit/fetch_product_cubit.dart';

abstract class AppRouter {
  late HomeRepository repository;
  late AuthRepositoryImpl authRepositoryImpl;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(AuthRepositoryImpl()),
          child: isLogged ? const HomeView() : const LoginView(),
        ),
      ),
      GoRoute(
        path: '/HomeView',
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: '/SiginUp',
        builder: (context, state) => SiginUp(),
      ),
      GoRoute(
        ///////////////////////this route animation should be review
        path: '/SearchView',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: SearchView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/ProfileView',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: ProfileView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/ProductDetailsView',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: ProductDetailsView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      // GoRoute(
      //   path: '/ExploreProductView',
      //   pageBuilder: (context, state) {
      //     return CustomTransitionPage(
      //       key: state.pageKey,
      //       child: ExploreProductView(),
      //       transitionsBuilder:
      //           (context, animation, secondaryAnimation, child) {
      //         return SlideTransition(
      //           position: Tween<Offset>(
      //             begin: const Offset(1.0, 0.0),
      //             end: Offset.zero,
      //           ).animate(animation),
      //           child: child,
      //         );
      //       },
      //     );
      //   },
      // ),
      GoRoute(
        path: '/ShoppingCart',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: ShoppingCart(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/ExploreProductView',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) => FetchProductCubit(
                  HomeRepositoryImplement(ApiService())..fetchAllProduct()),
              child: ExploreProductView(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
