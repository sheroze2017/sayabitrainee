import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayabidev_group_assign_1/view/login_screen.dart';

class Utils {
  static void FieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextNode) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static validateUser(
      String email, String username, String password, bool check) {
    if (check == true) {
      return FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseFirestore.instance
            .collection('userData')
            .doc(value.user!.uid)
            .set({"email": email, "password": password, "username": username});
        Get.to(loginScreen());
      });
    }
  }
}
