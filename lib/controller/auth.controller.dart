import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Navigation

  // Have A Global Auth Instance
  static AuthController instance = Get.find();

  var isLoading = false.obs;
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(auth.currentUser);
    // With Bind Stream Our User will be notified
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    // logout();
    // sleep(const Duration(seconds: 5));
    if (user == null) {
      debugPrint("Login Page ");
      Get.toNamed('/login');
      // Get.toNamed('/signup');
    } else {
      debugPrint("Data Page ");
      debugPrint(_user.value?.email);
      Get.offAllNamed('/home');
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      isLoading(true);
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account Creation Failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent);
    } finally {
      isLoading(false);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login Message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "login Failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent);
    } finally {
      isLoading(false);
    }
  }

  logout() async {
    await auth.signOut();
  }
}
