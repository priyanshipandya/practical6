import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical6/routes/custom_page_route.dart';
import 'package:practical6/second_page.dart';

class FirstPage extends StatelessWidget {
  final Function(int)? pageTwoOnTap;

  const FirstPage({Key? key, this.pageTwoOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("First Page"),
          centerTitle: true,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          bottom: const TabBar(
            tabs: [
              Icon(Icons.home),
              Icon(Icons.navigation_rounded),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Page1(),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    tileColor: Colors.blueGrey,
                    onTap: (){
                        pageTwoOnTap!(index);
                    },
                    title: Text("Item$index"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  Future<void> _lateNavigation(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecondPage(
            args: 'Alright',
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$result"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _lateNavigation(context);
              },
              child: const Text("Push"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/second", arguments: "On Generate Route");
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
                    builder: (context) =>
                        const SecondPage(args: "Cupertino hey"),
                  ),
                );
              },
              child: const Text("Cupertino Push"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  CustomPageRoute(
                    page: const SecondPage(
                      args: 'dsfghth',
                    ),
                  ),
                );
              },
              child: const Text("Custom Page Route"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/third", arguments: "I am passing data between screen");
              },
              child: const Text("Passing data between screens"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/forth");
              },
              child: const Text("Passing data between widgets"),
            ),
          ]),
    );
  }
}

class Details extends StatelessWidget {
  final int index;

  Details({required this.index});

  final List details = ["d0", "d1", "d2", "d3", "d4"];

  @override
  Widget build(BuildContext context) {
    var item = details[index];
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Text(item),
          ),
        ),
      ),
    );


  }
}
