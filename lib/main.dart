import 'package:flutter/material.dart';
import 'package:practical6/routes/navigation.dart';
import 'package:practical6/screens/data_with_widgets.dart';
import 'package:practical6/screens/pass_data.dart';
import 'package:practical6/second_page.dart';
import 'first_page.dart';

RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? selectedItem;

  void handleItem(int index) {
      setState(() {
        selectedItem = index;
      });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: "Chapter - 6",
      initialRoute: '/',
      navigatorObservers: [routeObserver],
      onGenerateRoute: (settings) => Navigation().generateRoute(settings),

      routes: {
        '/' : (context) => const FirstPage(),
        '/second' : (context) => const SecondPage(args : "Push Named"),
        '/third' : (context) => const PassData(),
        '/forth' : (context) =>  DataBetweenWidgets(),
        // '/fifth' : (context) => RouteObsever(),
      },
      // home: Navigator(
      //   pages: [
      //     MaterialPage(
      //       child: FirstPage(pageTwoOnTap: handleItem),
      //     ),
      //     if (selectedItem != null)
      //       MaterialPage(
      //         child: Details(
      //           index: selectedItem!,
      //         ),
      //       )
      //   ],
      //   onPopPage: (route, result) => route.didPop(result),
      // ),
    );
  }
}
