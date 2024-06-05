import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helloworld/firebase_options.dart';

login(email, password) async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var auth = FirebaseAuth.instance;
  try {
    var response =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    print(response);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}   


createUser(name, number, email, password) async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
 
  try {
    //cria o user na autenticacao do firebase
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    

    //adiciona os dados do user acima criado ao firestore
    await db.collection('Users').doc('1').set(
        {'name': name, 'number': number, 'email': email, 'password': password});
    return true;
  } catch (e) {
    print(e);
    return false;
  }

  // await db.collection('Users').add({
  //   'name':'Gabriel',
  //   'age':'21',
  //   'job':'Web Developer'
  // });

  // var data = await db.collection('Users').doc('1').get();
  // print(data.get('name'));

  // var data = await db.collection('Users').doc('1').delete();
}
