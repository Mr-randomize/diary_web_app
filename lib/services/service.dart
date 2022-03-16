import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_web_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DiaryService {
  final CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> loginUser(String email, String password) async {
     FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password);
     return;
  }

  Future<void> createUser(
      String displayName, BuildContext context, String uid,String profession) async {
    MUser user = MUser(
        avatarUrl: 'https://picsum.photos/200/300',
        profession: profession,
        displayName: displayName,
        uid: uid);
    userCollectionReference.add(user.toMap());
    return;
  }
}
