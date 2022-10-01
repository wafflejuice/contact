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
  var a = 3;
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
                return DialogUI(addPerson: (newPersonName) {
                  setState(() {
                    names.add(newPersonName);
                  });
                });
              });
        },
      ),
      appBar: AppBar(title: Text(a.toString())),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(names[i]),
          );
        },
      ),
      bottomNavigationBar: BottomBar(),
    );

    return app;
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.addPerson}) : super(key: key);
  final addPerson;
  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: TextField(
        controller: inputData,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              addPerson(inputData.text);
              Navigator.of(context).pop();
            },
            child: Text('OK')),
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
