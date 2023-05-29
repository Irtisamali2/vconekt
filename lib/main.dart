import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vconekt_interview/firebase_options.dart';
import 'package:vconekt_interview/providor/user_providor.dart';
import 'package:vconekt_interview/routes.dart';
import 'package:vconekt_interview/screens/login.dart';
import 'package:vconekt_interview/screens/profilescreen.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

        theme: ThemeData(primaryColor: Colors.blue,
      colorScheme: const ColorScheme.light(primary: Color.fromARGB(255, 36, 80, 80)),
      scaffoldBackgroundColor:Color.fromARGB(255, 233, 235, 238),
      appBarTheme: const AppBarTheme(elevation: 0,
      iconTheme: IconThemeData(color: Colors.black)) ),
      
      home:const SplashScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: ((settings) => generateRoute(settings)),

    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    // Add any additional initialization logic here

    _animationController.forward().then((_) {
      // Transition to the next screen after the splash animation completes
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  HomeScreen()),
      ); 
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
     double screenHeight =MediaQuery.of(context).size.height;
 double textsize =  screenHeight /40;
    return Scaffold(
      backgroundColor: Colors.white, // Customize the background color
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child:  Text('VCONEKT',style: 
          TextStyle(fontSize: textsize,fontWeight: FontWeight.bold,),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
   static const String routeName ='/signup-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState== ConnectionState.active){
            if(snapshot.hasData){
              return const ProfileScreen();
            }else if(snapshot.hasError){
              return Center(
                child:  Text('${snapshot.error}'),
              );
            }
          }
          if(snapshot.connectionState== ConnectionState.waiting){
            return const Center(
              child:  CircularProgressIndicator(),
            );
          }
          return LoginScreen();
        }),
    )
    
      ;
    
    }
}
