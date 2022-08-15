import 'package:auth_example/common/app_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Colors.black,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  final _loginFormKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _password = '';
  final bool byPassValidation = true;

  void _trySubmitForm() {
    final bool? isValid = _loginFormKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_password);

      Get.offAllNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppCard(
              child: Column(
                children: const <Widget>[
                  Text(
                    "Get All Health Data in App",
                    style: TextStyle(fontSize: 32.0),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            AppCard(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (byPassValidation) return null;
                      if (value!.isEmpty) {
                        return "You Can't have Empty Name !";
                      }
                      if (value.length < 2) {
                        return "Email must have More than One Characters";
                      }
                      if (!value.contains('@')) {
                        return "Invalid Email ";
                      }
                      // Check if the entered email has the right format
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      // Return null if the entered email is valid
                      return null;
                    },
                    onChanged: (value) => _userEmail = value,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (value) {
                      if (byPassValidation) return null;

                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (value.trim().length < 8) {
                        return 'Password must be at least 8 characters in length';
                      }
                      // Return null if the entered password is valid
                      return null;
                    },
                    onChanged: (value) => _password = value,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextButton(
                      onPressed: _trySubmitForm,
                      style: flatButtonStyle,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text("Login"),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(primary: Colors.black),
                      child: const Text("Forget Password?"),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't Have an account? "),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    Get.toNamed('/signup');
                  },
                  child: const Text("Sign up"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
