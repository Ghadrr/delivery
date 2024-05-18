import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helloworld/firebase_options.dart';

login() async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var auth = FirebaseAuth.instance;
  try {
    var response = await auth.signInWithEmailAndPassword(
        email: 'email@gmail.com', password: '12341234');
    print(response);
  } catch (e) {
    return false;
  }
}

creatUser() async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var auth = FirebaseAuth.instance;
  await auth.createUserWithEmailAndPassword(
      email: 'email@gmail.com', password: '12341234');
}
