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
  var names = ['John', 'Smith', 'Jane', 'Anaconda'];
  var phoneNumbers = [
    '010-1234-5676',
    '010-2645-2179',
    '010-9965-5210',
    '010-2341-6395'
  ];

  addPerson(newPersonName, newPhoneNumber) {
    setState(() {
      names.add(newPersonName);
      phoneNumbers.add(newPhoneNumber);
      names.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogUI(addPerson: addPerson);
              });
        },
      ),
      appBar: AppBar(title: Text(a.toString())),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.person),
            style: ListTileStyle.drawer,
            title: Text(names[i]),
            subtitle: Text(phoneNumbers[i]),
            trailing: ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  names.removeAt(i);
                });
              },
            ),
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
  var personNameInput = TextEditingController();
  var phoneNumberInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: personNameInput,
            ),
            TextField(
              controller: phoneNumberInput,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              if (personNameInput.text == '') {
                return;
              }

              addPerson(personNameInput.text, phoneNumberInput.text);
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
