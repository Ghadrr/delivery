import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_conect.dart';
import '../components/my_inputs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterLogo(
          size: 70,
        ),
        MyInput(hintText: 'Email', obscureText: false),
        MyInput(hintText: 'Senha', obscureText: true),
        ElevatedButton(
            onPressed: () {
              login();
            },
            child: Text('Entrar'))
      ],
    ));
  }
}
