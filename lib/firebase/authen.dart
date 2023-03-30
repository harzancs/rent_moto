import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

// Future<void> registerWithEmail(email, password) async {
//   try {
//     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       print('The account already exists for that email.');
//     }
//   } catch (e) {
//     print(e);
//     // Navigator.push(context, MaterialPageRoute(builder: (context) => Body()));
//   }
// }

Future<void> siginWithEmail(email, password) async {
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  } catch (e) {
    print(e);
  }
}


Future<void> signoutWithEmail() async {
  await FirebaseAuth.instance.signOut();
}
