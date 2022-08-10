import 'package:auth_example/pages/data_page.dart';
import 'package:auth_example/pages/signup_page.dart';
import 'package:auth_example/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:auth_example/pages/home_page.dart';
import 'package:auth_example/pages/login_page.dart';
import 'package:auth_example/pages/data_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   primaryColor: Colors.black,
        // ),
        theme: AppTheme.basic,
        initialRoute: '/',
        routes: {
          '/': (context) => DataPage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
        });
  }
}
