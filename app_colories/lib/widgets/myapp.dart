import 'package:flutter/material.dart';
import '../Screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp(  {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.blue ,
      ),
      home: const MyHomePage(title: ' Calories App '),
    );
  }
}