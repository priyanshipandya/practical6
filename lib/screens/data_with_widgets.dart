import 'package:flutter/material.dart';

class DataBetweenWidgets extends StatelessWidget {
  DataBetweenWidgets({Key? key}) : super(key: key);
  String msg = "I am passed from parent widget";

  @override
  Widget build(BuildContext context) {
    return ChildWidget(
      message: msg,
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data between Widgets'), centerTitle: true,),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
