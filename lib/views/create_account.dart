import 'package:flutter/material.dart';
import 'package:helloworld/components/my_inputs.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

  
    return Scaffold(
      body: Column(children: [FlutterLogo(size: 70,),
      MyInput(hintText: "email", obscureText: false, controller: email)
      
      
      ],),

    );
  }
}