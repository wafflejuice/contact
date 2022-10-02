import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
  getPermission() async {
    var status = await Permission.contacts.status;

    if (status.isGranted) {
      print('allowed');
      var contacts = await ContactsService.getContacts();
      setState(() {
        names = contacts;
      });
    } else if (status.isDenied) {
      print('not allowed');

      final newStatus = await Permission.contacts.request();

      if (newStatus.isRestricted ||
          newStatus.isPermanentlyDenied ||
          newStatus.isDenied) {
        openAppSettings();
      }
    }
  }

  List<Contact> names = [];

  addPerson(Contact newPerson) async {
    await ContactsService.addContact(newPerson);
    var newContacts = await ContactsService.getContacts();
    setState(() {
      names = newContacts;
    });
  }

  deletePerson(Contact target) async {
    await ContactsService.deleteContact(target);
    var newContacts = await ContactsService.getContacts();
    setState(() {
      names = newContacts;
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
      appBar: AppBar(
        title: Text(names.length.toString()),
        actions: [
          IconButton(
              onPressed: () {
                getPermission();
              },
              icon: Icon(Icons.contacts))
        ],
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.person),
            style: ListTileStyle.drawer,
            title: Text(names[i].givenName!),
            trailing: ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                deletePerson(names[i]);
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

              addPerson(Contact(givenName: personNameInput.text));
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
