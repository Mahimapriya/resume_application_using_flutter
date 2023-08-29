import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/authentication/models/user_model.dart';

class UserRepositary extends GetxController {
  static UserRepositary get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) {
    _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Information updated",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.cyan,
              colorText: Colors.white),
        )
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      print(error.toString());
    });
  }
}
