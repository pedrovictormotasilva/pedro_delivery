import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // get instancia da autenticacao do firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get do usuario logado
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //login
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      //try fazer login do usuario
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    }
    
    //catch de algum erro
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } 
    
  } 

  //cadastro
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      //try fazer cadastro do usuario
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    }
    //catch de algum erro
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //logout

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
