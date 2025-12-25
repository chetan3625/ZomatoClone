import 'package:flutter/material.dart';
import 'package:iosandandroid/router.dart';
import 'package:iosandandroid/view/auth/authscreen.dart';

void main(){
  runApp(UnsadApp());
}
class UnsadApp extends StatelessWidget {
  const UnsadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute:(settings)=>generateRoute(settings) ,
      debugShowCheckedModeBanner: false,
      title: "Zomato clone",
      home: Authscreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          secondary: Colors.redAccent
        )
      ),

    );
  }
}
