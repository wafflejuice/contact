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
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Image.asset('assets/doge.png'),
                title: Text('John'),
              );
            }),
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
