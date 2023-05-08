import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.args}) : super(key: key);
  final String args;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
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
                  Navigator.of(context).pop();
                },
                child: const Text("Pop"),
              ),
              Text(args),
            ]),
      ),
    );
  }
}
