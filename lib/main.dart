import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var names = ['John', 'Smith', 'Jane'];
  var likeCnts = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogUI();
              });
        },
      ),
      appBar: AppBar(),
      bottomNavigationBar: BottomBar(),
    );

    return app;
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: TextField(),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        TextButton(onPressed: () {}, child: Text('OK')),
      ],
    );
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
