import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
    var app = MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Text(likeCnts[i].toString()),
                title: Text(names[i]),
                trailing: ElevatedButton(
                  child: Text('좋아요'),
                  onPressed: () {
                    setState(() {
                      likeCnts[i]++;
                    });
                  },
                ),
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
