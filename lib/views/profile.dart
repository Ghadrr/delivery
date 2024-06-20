import 'package:flutter/material.dart';
import 'package:helloworld/components/my_inputs.dart';
import 'package:helloworld/services/firebase_conect.dart';
import 'package:helloworld/views/home_page.dart';
import 'package:helloworld/views/login_page.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text("Nome"),
            MyInput(
                hintText: "name",
                obscureText: false,
                controller: nameController),
            Text("Telefone"),
            MyInput(
                hintText: "number",
                obscureText: false,
                controller: numberController),
            Text("Endereço"),
            MyInput(
                hintText: "endereco",
                obscureText: false,
                controller: enderecoController),
            Text("Senha"),
            MyInput(
                hintText: "password",
                obscureText: false,
                controller: passwordController),
            Text("Confirmar Senha"),
            MyInput(
                hintText: "confirm password",
                obscureText: false,
                controller: confirmPasswordController),
            ElevatedButton(
                onPressed: () async {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("As Senhas Não coincidem"),
                      backgroundColor: Colors.red,
                    ));
                    return;
                  }
                  var db = await change_user(
                      nameController.text,
                      numberController.text,
                      enderecoController.text,
                      passwordController.text);
                  if (db == true) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("falha ao alterar o usuario"),
                        backgroundColor: Colors.red)));
                  }
                },
                child: Text("Editar Perfil"))
          ],
        ),
      ),
    );
  }
}
