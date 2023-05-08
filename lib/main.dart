import 'package:flutter/material.dart';
import 'package:practical6/routes/navigation.dart';
import 'package:practical6/second_page.dart';

import 'first_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: "Chapter - 6",
      initialRoute: '/',

      onGenerateRoute: (settings) => Navigation().generateRoute(settings),

      routes: {
        '/' : (context) => FirstPage(),
        '/second' : (context) => SecondPage(args : "Push Named"),
      },
      // home: SecondPage(),
    );
  }
}
