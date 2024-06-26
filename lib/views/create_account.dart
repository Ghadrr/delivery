import 'package:flutter/material.dart';
import 'package:helloworld/components/my_inputs.dart';
import 'package:helloworld/services/firebase_conect.dart';
import 'package:helloworld/views/login_page.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController enderecoController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              FlutterLogo(
                size: 70,
              ),
              Text("Nome"),
              MyInput(
                  hintText: "nome",
                  obscureText: false,
                  controller: nameController),
              Text("Telefone"),
              MyInput(
                  hintText: "numero",
                  obscureText: false,
                  controller: numberController),
              Text("Endereço"),
              MyInput(
                  hintText: "Endereco",
                  obscureText: false,
                  controller: enderecoController),
              Text("Email"),
              MyInput(
                  hintText: "email",
                  obscureText: false,
                  controller: emailController),
              Text("Senha"),
              MyInput(
                  hintText: "senha",
                  obscureText: true,
                  controller: passwordController),
              Text("Confirme sua senha"),
              MyInput(
                  hintText: "confirme sua senha",
                  obscureText: true,
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
                    var db = await createUser(
                        nameController.text,
                        numberController.text,
                        emailController.text,
                        enderecoController.text,
                        passwordController.text);
                    if (db == true) {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {
                      (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("falha ao criar usuario"),
                          backgroundColor: Colors.red)));
                    }
                  },
                  child: Text("Criar conta"))
            ],
          ),
        ),
      ),
    );
  }
}
