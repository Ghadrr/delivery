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
      appBar: AppBar(
        title: Text('NeedFood'),
      ),
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsetsDirectional.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.all(15),
              child: FlutterLogo(
                size: 70,
              ),
            ),
            Text("Email"),
            MyInput(
              hintText: 'Email',
              obscureText: false,
              controller: emailController,
            ),
            Text("Senha"),
            MyInput(
                hintText: 'Senha',
                obscureText: true,
                controller: passwordController),
            Container(
              margin: EdgeInsetsDirectional.all(15),
              child: ElevatedButton(
                  onPressed: () async {
                    var auth =
                        await login(emailController.text, passwordController.text);
                    if (auth == true) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else
                      (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Usuario ou senha incorreto(s)"),
                          backgroundColor: Colors.red)));
                  },
                  child: Text('Entrar')),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateAccount()));
              },
              child: Text('Criar Conta'),
            )
          ],
        ),
      ),
    ));
  }
}
