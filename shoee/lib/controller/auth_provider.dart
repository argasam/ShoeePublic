import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoee/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:shoee/repository/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository> ((ref) {
  return AuthRepository(FirebaseAuth.instance, FirebaseFirestore.instance);
},);

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authRepositoryProvider).authStateChanges;
});

