import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PassData extends StatelessWidget {
  const PassData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String result = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass data"),
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
              Text(result),
            ]),
      ),
    );
  }
}
