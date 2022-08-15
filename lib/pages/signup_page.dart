import 'package:auth_example/common/app_card.dart';
import 'package:auth_example/controller/auth.controller.dart';
import 'package:auth_example/utils/form_valider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  // _submitSignUpForm() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // key: _signupFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppCard(
                child: Column(
                  children: const <Widget>[
                    Text(
                      "Sign Up ",
                      style: TextStyle(fontSize: 32.0),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              AppCard(
                child: SignupForm(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have an account? "),
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.black),
                    onPressed: () => Get.offAllNamed('/login'),
                    child: const Text("Login"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  SignupForm({
    Key? key,
  }) : super(key: key);

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

  final _signupFormKey = GlobalKey<FormState>();

  FormValidater check = Get.find();
  String _userEmail = '';
  String _password = '';
  String _confirmPassword = '';
  _trySubmit() {
    final form = _signupFormKey.currentState;
    if (form!.validate()) {
      debugPrint(_userEmail.trim());
      debugPrint(_password.trim());
      debugPrint(AuthController.instance.isLoading.isFalse.toString());

      if (AuthController.instance.isLoading.isFalse) {
        AuthController.instance.signup(_userEmail.trim(), _password.trim());
      }
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signupFormKey,
        // margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) => check.validEmail(value),
              onChanged: (value) => _userEmail = value,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              validator: (value) => check.validPassword(value),
              onChanged: (value) => _password = value,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            TextFormField(
              validator: (value) =>
                  check.isSame(value, _password, "Password is Not Same"),
              onChanged: (value) => _confirmPassword = value,
              decoration: const InputDecoration(labelText: "Confirm Password"),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: _trySubmit,
                style: flatButtonStyle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Obx(
                    () => AuthController.instance.isLoading.isTrue
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : const Text("SignUp"),
                  ),
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
        ));
  }
}
// Obx(() => {
//                         if(AuthController.instance.isLoading) const CircularProgressIndicator();
//                         else Text("SignUp") ,
//                   })