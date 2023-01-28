import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sayabidev_group_assign_1/view/home_screen.dart';
import 'package:sayabidev_group_assign_1/view/register_screen.dart';

import '../utils/utils.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = new TextEditingController();
    final TextEditingController passwordcontroller =
        new TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Icon(Icons.arrow_back),
                    )),
              ],
            ),
            SizedBox(
              height: height / 10,
            ),

            Image(
              image: AssetImage('assets/images/tmc.png'),
              height: height / 4.5,
              width: width * 0.8,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
                    focusNode: emailFocusNode,
                    onFieldSubmitted: (val) {
                      Utils.FieldFocusChange(
                          context, emailFocusNode, passwordFocusNode);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Email'),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextFormField(
                    focusNode: passwordFocusNode,
                    obscureText: true,
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Password'),
                  ),
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 6, bottom: 6),
              child: InkWell(
                onTap: (() async {
                  Login(emailcontroller.text.toString(),
                      passwordcontroller.text.toString());
                }),
                child: Container(
                  width: width / 2,
                  height: height / 12,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.grey[200], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not Have A Account? ',
                  style: TextStyle(fontSize: width / 30),
                ),
                GestureDetector(
                  onTap: () => Get.to(registerScreen(),
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(seconds: 1)),
                  child: Text(
                    'Register Now!',
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
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
            ),
            Text(
              'Login With',
              style: TextStyle(
                  fontSize: width / 22,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );
  }
}

Login(String email, String password) {
  try {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.to(homeScreen()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Get.snackbar('Error', 'User Not Found');
    } else if (e.code == 'wrong-password') {
      Get.snackbar('Error', 'Wrong Password');
    }
  }
}
