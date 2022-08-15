import 'package:flutter/cupertino.dart';

class FormValidater {
  final bool _byPassValidation = false;

  String? isSame(String? value, String compare, String errorMessage) {
    if (_byPassValidation) return null;

    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    if (value != compare) {
      return errorMessage;
    }
    return null;
  }

  String? validPassword(String? value) {
    if (_byPassValidation) return null;

    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (value.trim().length < 8) {
      return 'Password must be at least 8 characters in length';
    }
    // Return null if the entered password is valid
    return null;
  }

  String? validEmail(String? value) {
    debugPrint(value);
    if (_byPassValidation) return null;
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
  }
}
