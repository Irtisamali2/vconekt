import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vconekt_interview/resources/authentication.dart';
import 'package:vconekt_interview/screens/login.dart';
import 'package:vconekt_interview/utils/textfield.dart';

class SignupScreen extends StatefulWidget {
    static const String routeName ='/signup-screen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

    final TextEditingController _userName = TextEditingController();
  final _signupkey = GlobalKey<FormState>();


     @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userName.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void registerUsser() async{
      String response = await Authentication()
      .registerUser(email: _emailController.text, 
      password: _passwordController.text, 
      username: _userName.text);

      if(response=='success'){
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, LoginScreen.routeName);
      }
    }


    return Scaffold(
      appBar: AppBar(
        title:const Text('Signup'),
    centerTitle: true,  

      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0.h),
        child: Card(
          child: Form(
            key: _signupkey,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    controller: _emailController,
                    labelText: 'Enter your email address',
                    prefixIcon: const Icon(Icons.email),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    labelText: 'Password',
                    controller: _passwordController,
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  SizedBox(height: 16.h),
                    
                  CustomTextField(
                    labelText: 'Username',
                    controller: _userName,
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  SizedBox(height: 16.h),
              
                  SizedBox(height: 32.h),
                  ElevatedButton(
                    onPressed: (){
                       if(_signupkey.currentState!.validate()){
                              registerUsser();
                            }
                    },
                    child: const Text('Signup'),
                  ),
                  SizedBox(height: 16.h),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to the login screen
                    },
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: const Text('Already have an account? Login')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}