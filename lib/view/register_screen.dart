import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sayabidev_group_assign_1/utils/routes/routes_name.dart';
import 'package:sayabidev_group_assign_1/view/login_screen.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import '../utils/utils.dart';

class registerScreen extends StatelessWidget {
  registerScreen({super.key});
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController usercontroller = new TextEditingController();

    final TextEditingController emailcontroller = new TextEditingController();
    final TextEditingController passwordcontroller =
        new TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();
    FocusNode userFocusNode = FocusNode();
    Map doc;
    bool check = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Join Us',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: height / 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 5, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        focusNode: emailFocusNode,
                        onFieldSubmitted: (val) {
                          Utils.FieldFocusChange(
                              context, emailFocusNode, userFocusNode);
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 5, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextFormField(
                        focusNode: userFocusNode,
                        onFieldSubmitted: (val) {
                          Utils.FieldFocusChange(
                              context, userFocusNode, passwordFocusNode);
                        },
                        controller: usercontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Username'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 5, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextFormField(
                        // onTap: () => FutureBuilder(builder: ),
                        obscureText: true,
                        controller: passwordcontroller,
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                FlutterPwValidator(
                  key: validatorKey,
                  controller: passwordcontroller,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  specialCharCount: 1,
                  width: width / 2,
                  height: height / 10,
                  onSuccess: () {
                    check = true;
                  },
                  onFail: () {
                    check = false;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width / 2,
                    height: height / 12,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          if (check = true) {
                            validateUser(
                                emailcontroller.text.toString(),
                                usercontroller.text.toString(),
                                passwordcontroller.text.toString(),
                                check);
                          } else {
                            Get.snackbar('Error', 'Empty Fields');
                            print('he');
                          }
                        }
                        // FirebaseAuth.instance
                        //     .createUserWithEmailAndPassword(
                        //         email: emailcontroller.text.toString(),
                        //         password: passwordcontroller.text.toString())
                        //     .then((value) {
                        //   FirebaseFirestore.instance
                        //       .collection('userData')
                        //       .doc(value.user!.uid)
                        //       .set({
                        //     "email": emailcontroller.text.toString(),
                        //     "password": passwordcontroller.text.toString(),
                        //     "username": usercontroller.text.toString()
                        //   });
                        // }),
                        ,
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have An Account? ',
                      style: TextStyle(fontSize: width / 30),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(loginScreen(),
                          transition: Transition.leftToRightWithFade,
                          duration: Duration(seconds: 1)),
                      child: Text(
                        'Sign In!',
                        style: TextStyle(
                            fontSize: width / 30,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage('assets/images/fbicon.png'),
                      height: height / 20,
                      width: width / 10,
                    ),
                    Image(
                      image: AssetImage('assets/images/google.png'),
                      height: height / 20,
                      width: width / 10,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Register With',
                    style: TextStyle(
                        fontSize: width / 22,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

validateUser(String email, String username, String password, bool check) {
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
