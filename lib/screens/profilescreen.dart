import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vconekt_interview/providor/user_providor.dart';
import 'package:vconekt_interview/screens/apiText.dart';
import 'package:vconekt_interview/screens/login.dart';

import '../models/userData.dart';

class ProfileScreen extends StatefulWidget {
        static const String routeName ='/profile-screen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
 

class _ProfileScreenState extends State<ProfileScreen> {
  String username = "";

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

   getUser() async{

UserProvider userProvider = Provider.of(context,listen: false);
await userProvider.Userupdated();
     
  }
  @override
  Widget build(BuildContext context) {
    UserData? userData = Provider.of<UserProvider>(context).getUser;
    return Scaffold(appBar: AppBar(
      title: const Text('Profile'),
      actions: [IconButton(onPressed: ()async{

        await FirebaseAuth.instance.signOut();

        Navigator.pushNamed(context, LoginScreen.routeName);

      }, icon: const Icon(Icons.logout))],
    ),
    body: Expanded(
      child: Column(children: [
        Text('${userData?.username}'),
        SizedBox(height: 20.h,),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>MyScreen()));
        }, child:const Text('Check Api'))
      ]),
    ),
    );
  }
}