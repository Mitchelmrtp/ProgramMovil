import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timeapp/pages/signin/signin_page.dart';
import '../../models/entities/user.dart';
import '../home/home_page.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var message = "".obs;
  var messageColor = Colors.yellow.obs;

  List<User> users = [
    User(user: "user1", password: "password1"),
    User(user: "user2", password: "password2"),
    User(user: "user3", password: "password3"),
    User(user: "user4", password: "password4"),
    User(user: "user5", password: "password5"),
    User(user: "user6", password: "password6"),
    User(user: "user7", password: "password7"),
    User(user: "user8", password: "password8"),
    User(user: "user9", password: "password9"),
    User(user: "user10", password: "password10"),
  ];

  void login(BuildContext context) {
    //print('usuario: ${userController.text}, contraseña: ${passwordController.text}');
    String user = userController.text;
    String password = passwordController.text;
    User newUser = User(password: password, user: user);
    bool found = false;
    for (User u in users) {
      if (u.user == newUser.user && u.password == newUser.password) {
        found = true;
      }
    }
    if (found) {
      message.value = 'usuario encontrado';
      messageColor.value = Colors.green;
    } else {
      message.value = 'usuario no encontrado';
      messageColor.value = Colors.red;
    }
    Future.delayed(Duration(seconds: 5), () {
      message.value = '';
      if (messageColor.value == Colors.green) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  void goResetPassword(BuildContext context) {
    print('nos vamos ResetPassword');
  }

  void goToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }
}
