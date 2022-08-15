import 'package:auth_example/common/app_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              child: Container(
                  // margin: const EdgeInsets.only(top: 20),
                  child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Confirm Password"),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextButton(
                      onPressed: () {
                        Get.offAllNamed('/');
                      },
                      style: flatButtonStyle,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text("SignUp"),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(top: 4.0),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(primary: Colors.black),
                      child: const Text("Forget Password?"),
                    ),
                  )
                ],
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already Have an account? "),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: const Text("Login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
