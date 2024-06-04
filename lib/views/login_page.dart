import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_conect.dart';
import 'package:helloworld/views/create_account.dart';
import 'package:helloworld/views/home_page.dart';
import '../components/my_inputs.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterLogo(
          size: 70,
        ),
        MyInput(
            hintText: 'Email', obscureText: false, controller: emailController),
        MyInput(
            hintText: 'Senha',
            obscureText: true,
            controller: passwordController),
        ElevatedButton(
            onPressed: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> HomePage()) );
            }, 
            // async {
            //   var auth =
            //       await login(emailController.text, passwordController.text);
            //   if (auth == true) {
            //     Navigator.pushReplacement(context,
            //         MaterialPageRoute(builder: (context) => HomePage()));
            //   } else
            //     (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //         content: Text("Usuario ou senha incorreto(s)"),
            //         backgroundColor: Colors.red)));
            // },
            child: Text('Entrar')),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => CreateAccount()));
          },
          child: Text('Criar Conta'),
        )
      ],
    ));
  }
}