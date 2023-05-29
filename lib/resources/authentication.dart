import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vconekt_interview/models/userData.dart';

class Authentication{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerUser({
    required String email,
    required String password,
    required String username,


  })async{
    String response= "Some Error has been occured";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        UserData user= UserData(email: email, uid:credential.user!.uid, username: username);

        await _firestore.collection('users').doc(credential.user!.uid).set(user.toMap(),);
        response ='success';
      }

    }catch(e){
      response =e.toString();
    }
    return response;
  }

    Future<String> loginUser({
    required String email,
    required String password,


  })async{
    String response= "Some Error has been occured";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);


        response ='success';
      }

    }catch(e){
      response =e.toString();
    }
    return response;
  }

  Future<UserData> getUserData() async {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

return UserData.fromSnapshot(snapshot as DocumentSnapshot<Map<String, dynamic>>);

  }
}