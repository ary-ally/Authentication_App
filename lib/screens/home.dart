import 'package:authentication_app/screens/emailedit.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Edit E.mail Address'),
          onTap: (){Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Emailedit()));},
        ),
        ListTile(
          title: const Text('Contact Us'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('About'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
    ),
    );
  }
}
