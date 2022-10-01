import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Row(children: [
              Icon(Icons.account_circle),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('John'),
              ),
            ]),
            Row(children: [
              Icon(Icons.account_circle),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('John'),
              ),
            ]),
            Row(children: [
              Icon(Icons.account_circle),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('John'),
              ),
            ]),
          ],
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );

    return app;
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page),
          ],
        ),
      ),
    );
  }
}
