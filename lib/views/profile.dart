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
    return Scaffold(
      appBar: AppBar(
        title: Text('Alterar Perfil'),
      ),
      body: Container(
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
            ElevatedButton(
                onPressed: () async {
                  var auth = await change_user(
                    nameController.text,
                    numberController.text,
                    enderecoController.text,
                  );
                  if (auth == true) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      "Dados alterados",
                    )));
                  } else
                    (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      "Error",
                    ))));
                },
                child: Text("Alterar Dados")),
          ],
        ),
      ),
    );
  }
}
