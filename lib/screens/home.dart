import 'package:authentication_app/model/user_model.dart';
import 'package:authentication_app/screens/about.dart';
import 'package:authentication_app/screens/emailedit.dart';
import 'package:authentication_app/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:authentication_app/screens/contactus.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("images/logo1.png", fit: BoxFit.contain),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Welcome to Team CSI",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${loggedInUser.name}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 20)),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 20)),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFBEC3FC),
                ),
                child: Text(
                  'Team CSI Page',
                  style: TextStyle(fontSize: 30, color: Colors.purpleAccent),
                )),
            ListTile(
              title: const Text(
                'Edit E.mail Address',
                style: TextStyle(fontSize: 20, color: Color(0xFF6B75CE)),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Emailedit()));
              },
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, color: Color(0xFF6B75CE)),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'About',
                style: TextStyle(fontSize: 20, color: Color(0xFF6B75CE)),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const About()));
              },
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(fontSize: 20, color: Color(0xFF6B75CE)),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Contactus()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
}
