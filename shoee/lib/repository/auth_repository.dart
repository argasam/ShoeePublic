import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRepository{
  final FirebaseAuth _auth;
  final FirebaseFirestore _db;
  const AuthRepository(this._auth, this._db);
  
  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<User?> loginwithEmailandPassword (String email, String password) async{
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found'){
        throw AuthException('User not found');
      }else if (e.code == 'wrong-password'){
        throw AuthException('Wrong password');
      }
      else{
        throw AuthException('An Error Occured, Please try again later');
      }
    }
  }
  void signup(){

  }
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('User signed out successfully.');
    }catch (e){
      print('Error Signing Out: $e');
    }
    
  }

  Future<void> signUp(String email, String password, String nama) async {
    
    try{
      final newuser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
      
      _db.collection(
        'users')
        .doc(newuser.user?.uid)
        .set({
          "name": nama,
          });
    } on FirebaseAuthException catch (e){
      if (e.code == 'weak-password') {
        throw AuthException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('The account already exists for that email.');
      }
    }catch (e){
      throw AuthException('An Error Occured, Please try again later');
    }
  }
    
  void forgetpassword(){

  }

  
}

class AuthException implements Exception{
  final String message;

  AuthException(this.message);

  @override
  String toString(){
    return message;
  }
}