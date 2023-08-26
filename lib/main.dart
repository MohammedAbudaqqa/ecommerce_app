import 'package:ecommerce_audio/controllers/cubit/auth_cubit.dart';
import 'package:ecommerce_audio/core/utils/api_service.dart';
import 'package:ecommerce_audio/core/utils/app_router.dart';
import 'package:ecommerce_audio/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_audio/features/home/presentaion/view_models/cubit/fetch_product_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'domain/repositories.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final isLogged = prefs.getBool("isLoggedIn");
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  ApiService? apiService;
  HomeRepository? homeRepository;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchProductCubit(homeRepository!..fetchAllProduct()),
        ),
        BlocProvider(
          create: (context) => AuthCubit(AuthRepositoryImpl()),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'E-commerce ',
        theme: ThemeData(
          fontFamily: 'DMSans',
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(
                Color(0xff0ACF83),
              ),
            ),
          ),
          useMaterial3: true,
        ),
        //   home: const LoginView(),
      ),
    );
  }
}
