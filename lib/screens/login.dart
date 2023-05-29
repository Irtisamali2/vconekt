import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vconekt_interview/main.dart';
import 'package:vconekt_interview/resources/authentication.dart';
import 'package:vconekt_interview/screens/signup.dart';

import '../utils/textfield.dart';

class LoginScreen extends StatefulWidget {
      static const String routeName ='/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _loginkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
 double screenHeight =MediaQuery.of(context).size.height;
  double screenWidth =MediaQuery.of(context).size.width;

 
 double textsize =  screenHeight /49;

    void loginUser() async{
      String res = await Authentication().loginUser(email: _emailController.text, password: _passwordController.text);
      if(res=='success'){
        Navigator.pushNamed(context, HomeScreen.routeName);
      }

    }
     ScreenUtil.init(context, designSize:  Size(screenWidth, screenHeight));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,

      ),
      body: Padding(
        padding:  EdgeInsets.all(textsize),
        child: Card(
          child: Form(
            key: _loginkey,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  CustomTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: true,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      if(_loginkey.currentState!.validate()){
                        loginUser();
                      }
                    },
                    child: const Text('Login'),
                  ),
                  SizedBox(height: 16.h),
                InkWell(onTap: (){
                 Navigator.pushNamed(context, SignupScreen.routeName);
                      
                      
                },
                child: Center(child: RichText(text: const TextSpan( text: 'Do not have an account  ' , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black ,
                      ), children: [
                  TextSpan(text: 'Signup',  style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),)
                ]) ,))),
                      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}