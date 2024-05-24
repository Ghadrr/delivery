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

creatUser() async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var db = FirebaseFirestore.instance;

  await db.collection('Users').doc('1').set({
    'name':'Gabriel',
    'age':'21',
    'job':'Web Developer'
  });
  
  // await db.collection('Users').add({
  //   'name':'Gabriel',
  //   'age':'21',
  //   'job':'Web Developer'
  // });

  // var data = await db.collection('Users').doc('1').get();
  // print(data.get('name'));
  
  // var data = await db.collection('Users').doc('1').delete();
}
