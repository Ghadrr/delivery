import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helloworld/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

FirebaseFirestore getFirebaseFirestoreInstance() {
  return FirebaseFirestore.instance;
}

Future<FirebaseApp> getFirebaseApp() {
  return Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
}

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

createUser(name, number, email, endereco, password) async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;

  try {
    //cria o user na autenticacao do firebase
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    //adiciona os dados do user acima criado ao firestore
    await db.collection('Users').doc(userCredential.user?.uid).set({
      'name': name,
      'number': number,
      'email': email,
      'endereco': endereco,
      'password': password,
      'carrinho': [],
      'compras': [],
      'favoritos': [],
    });
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

change_user(name, number, endereco) async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  try {
    print(auth.currentUser!);
    await db.collection("Users").doc(auth.currentUser!.uid).update({
      'name': name,
      'number': number,
      'email': auth.currentUser!.email,
      'endereco': endereco,
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

get_user_elements() async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  try {
    var prod = await db.collection("Users").doc(auth.currentUser!.uid).get();
    print(prod);
    return prod.data();
  } catch (e) {
    print(e);
    return e;
  }
}

add_cart(produto) async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  try {
    await db.collection("Users").doc(auth.currentUser!.uid).update({
      'carrinho': FieldValue.arrayUnion([produto]),
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
add_favorite(produto) async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  try {
    await db.collection("Users").doc(auth.currentUser!.uid).update({
      'favoritos': FieldValue.arrayUnion([produto]),
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
comprar(produto) async {
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  try {
    await db.collection("Users").doc(auth.currentUser!.uid).update({
      'compras': FieldValue.arrayUnion(produto),
      'carrinho':[]
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

user_feedback(message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;
  try {
    await db.collection('feedback').add({
      'feedback_message': message,
      'user': auth.currentUser!.email,
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

// get_user() async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   var db = FirebaseFirestore.instance;
//   var auth = FirebaseAuth.instance;
//   var user = await db.collection("Users").doc(auth.currentUser!.uid).get();

//   var users = user.docs
//       .map(
//         (e) => e.data(),
//       )
//       .toList();

//   return items;
// }

get_logos() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var db = FirebaseFirestore.instance;
  var logos = await db.collection("logos").get();

  var items = logos.docs
      .map(
        (e) => e.data(),
      )
      .toList();

  return items;
}

get_all_prod() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var db = FirebaseFirestore.instance;
  var logos = await db.collection("Produtos").get();

  var items = logos.docs
      .map(
        (e) => e.data(),
      )
      .toList();

  return items;
}

getAllCategories() async {
  await getFirebaseApp();

  bool result = false;
  var db = getFirebaseFirestoreInstance();

  try {
    var snapshot = await db.collection('Produtos').get();
    var categories = snapshot.docs.map((c) => c.data()).toList();

    return categories;
  } catch (e) {
    return result;
  }
}
