import 'package:flutter/material.dart';
import 'package:helloworld/components/my_inputs.dart';
import 'package:helloworld/services/firebase_conect.dart';

class feedback extends StatefulWidget {
  const feedback({super.key});

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  TextEditingController feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Nome"),
            MyInput(
                hintText: "feedback",
                obscureText: false,
                controller: feedbackController),
      ElevatedButton(
        onPressed: () async {
          var auth = await user_feedback(feedbackController.text);
          if (auth == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Feedback enviado",
                ),
              ),
            );
          } else
            (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              "Error",
            ))));
        },
        child: Text("Enviar feedback"),
      ),
          ],
        ),
      ),
    );
  }
}
