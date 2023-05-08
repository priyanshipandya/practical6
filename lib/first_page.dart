import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical6/routes/custom_page_route.dart';
import 'package:practical6/second_page.dart';

class FirstPage extends  StatelessWidget{
  FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
        centerTitle: true,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SecondPage(args: "hey"),
                    ),
                  );
                },
                child: const Text("Push"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/second", arguments: "On Generate Route");
                },
                child: const Text("On Generate Route"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/second");
                },
                child: const Text("Push Named"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => const SecondPage(args: "Cupertino hey"),
                    ),
                  );
                },
                child: const Text("Cupertino Push"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CustomPageRoute(
                       page: SecondPage(args: 'dsfghth',),
                    ),
                  );
                },
                child: const Text("Custom Page Route"),
              ),
            ]),
      ),
    );
  }
}
