import 'package:auth_example/pages/splash_page.dart';
import 'package:auth_example/utils/form_valider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:auth_example/controller/auth.controller.dart';
import 'package:auth_example/pages/data_page.dart';
import 'package:auth_example/pages/login_page.dart';
import 'package:auth_example/pages/pokemon_page.dart';
import 'package:auth_example/pages/signup_page.dart';
import 'package:auth_example/service/pokemon/pokemon.models.dart';
import 'package:auth_example/theme/app_theme.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
  // ignore: unused_local_variable
  FormValidater check = Get.put(FormValidater());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokédex',
      // theme: ThemeData(
      //   primaryColor: Colors.black,
      // ),
      theme: AppTheme.basic,
      initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/pokemon', page: () => PokemonPage()),
      // ],
      getPages: [
        GetPage(name: '/home', page: () => const DataPage()),
        GetPage(name: '/', page: () => const SplashPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/signup', page: () => const SignUpPage()),
        GetPage(
            name: '/PokemonPage',
            page: () => PokemonPage(pokemon: Pokemon.empty())),
      ],
      // routes: {
      //   '/': (context) => const DataPage(),
      //   '/login': (context) => LoginPage(),
      //   '/signup': (context) => SignUpPage(),
      //   '/PokemonPage': (context) => PokemonPage(pokemon: Pokemon.empty()),
      // },
    );
  }
}
