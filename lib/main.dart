import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_app/pages/home/user_home.dart';
import 'package:dsc_app/pages/home/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
          textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
          primaryTextTheme:
              Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.black),
          appBarTheme: (AppBarTheme(
              textTheme:
                  GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              actionsIconTheme: IconThemeData(color: Colors.black)))),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WrapperPage extends StatefulWidget {
  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    User user = FirebaseAuth.instance.currentUser;
    isLoggedIn = user != null ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? UserHome() : WelcomePage();
  }
}
