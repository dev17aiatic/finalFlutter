import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void Initialing() async {
  await Firebase.initializeApp();
}

void stateFirebase(context) {
  FirebaseAuth.instance.authStateChanges().listen((
    User user,
  ) {
    if (user == null) {
      print('User is currently signed out!');
      Navigator.pushNamed(context, '/login');
    } else {
      print('User is signed in!');
      //Navigator.pushReplacementNamed(context, '/news');
      Navigator.pushNamed(context, '/news');
    }
  });
}

showMaterialDialog({@required context, @required String message}) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: new Text("Warning!"),
            content: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Close me!'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
}

Future<void> registerUser(
    @required email, @required password, @required context) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      //print('The password provided is too weak.');
      showMaterialDialog(
        context: context,
        message: 'The password provided is too weak.',
      );
    } else if (e.code == 'email-already-in-use') {
      //print('The account already exists for that email.');
      showMaterialDialog(
        context: context,
        message: 'The account already exists for that email.',
      );
    }
  } catch (e) {
    print(e);
    showMaterialDialog(
      context: context,
      message: e,
    );
  }
}

Future<void> signIn(
    @required email, @required password, @required context) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      //print('No user found for that email.');
      showMaterialDialog(
        context: context,
        message: 'No user found for that email.',
      );
    } else if (e.code == 'wrong-password') {
      //print('Wrong password provided for that user.');
      showMaterialDialog(
        context: context,
        message: 'Wrong password provided for that user.',
      );
    }
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
