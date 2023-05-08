import 'package:flutter/material.dart';
import 'package:practical6/second_page.dart';

import '../first_page.dart';

class Navigation {
  Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case ('/'):
        return MaterialPageRoute(
          allowSnapshotting: true,
          builder: (context) => FirstPage(),
        );
      case ('/second'):
        return MaterialPageRoute(
          builder: (context) => SecondPage(args: args.toString()),
        );
      default:
        return MaterialPageRoute(builder: (context) => ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ERROR"),
      ),
    );
  }
}
