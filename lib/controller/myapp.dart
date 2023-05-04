import 'package:flutter/material.dart';
import '../view/createUsers.dart';
import '../view/listUsers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 13, 41)
        
      ),
      initialRoute: '/createusers',
      routes: {
        '/createusers': (context) => const CreateUsers(),
        '/listusers': (context) => const ListUsers(),
      },
    );
  }
}


/*

MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
    inputDecorationTheme: const InputDecorationTheme(
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.pinkAccent), //<-- SEE HERE
    ),
  ),
  home: ChangeTextFieldColorDemo(),
);

*/