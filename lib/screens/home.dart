import 'package:authentication_app/model/user_model.dart';
import 'package:authentication_app/screens/about.dart';
import 'package:authentication_app/screens/emailedit.dart';
import 'package:authentication_app/screens/login.dart';
import 'package:authentication_app/screens/password.dart';
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
    return SafeArea(
      child: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("images/logo1.png", fit: BoxFit.contain),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                              child: Text(
                                "Welcome, ${loggedInUser.name} !",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Card(
                              color: Colors.deepPurple.shade200,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5.0),
                                      child: Center(
                                        child: Text("Entered Details",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20)),
                                      ),
                                    ),
                                    Card(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0, horizontal: 5.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Username : ",
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                  ),
                                                ),
                                                Text(
                                                  "${loggedInUser.name}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'Ubuntu',
                                                      color: Colors
                                                          .deepPurpleAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0, horizontal: 5.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Email : ",
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                  ),
                                                ),
                                                Text(
                                                  "${loggedInUser.email}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'Ubuntu',
                                                      color: Colors
                                                          .deepPurpleAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0, horizontal: 5.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "RollNo. : ",
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                  ),
                                                ),
                                                Text(
                                                  "${loggedInUser.roll}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'Ubuntu',
                                                      color: Colors
                                                          .deepPurpleAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0, horizontal: 5.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Gender : ",
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                  ),
                                                ),
                                                Text(
                                                  "${loggedInUser.gender}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'Ubuntu',
                                                      color: Colors
                                                          .deepPurpleAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0, horizontal: 5.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Year : ",
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                  ),
                                                ),
                                                Text(
                                                  "${loggedInUser.year}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'Ubuntu',
                                                      color: Colors
                                                          .deepPurpleAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0, horizontal: 5.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Branch : ",
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                  ),
                                                ),
                                                Text(
                                                  "${loggedInUser.branch}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'Ubuntu',
                                                      color: Colors
                                                          .deepPurpleAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3.0, horizontal: 5.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Address : ",
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                  ),
                                                ),
                                                Text(
                                                  "${loggedInUser.add}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'Ubuntu',
                                                      color: Colors
                                                          .deepPurpleAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: ActionChip(
                                            backgroundColor:
                                                Colors.purpleAccent,
                                            label: Text(
                                              "Logout",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                fontFamily: 'Ubuntu',
                                              ),
                                            ),
                                            onPressed: () {
                                              logout(context);
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.blueGrey.shade100,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              Container(
                height: 80,
                child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.shade100,
                  ),
                  child: Container(
                    child: Text(
                      "Hello, ${loggedInUser.name}!",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.white,
                title: const Text(
                  'Edit login info',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Password()));
                },
              ),
              ListTile(
                tileColor: Colors.white,
                title: const Text(
                  'About Us',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const About()));
                },
              ),
              ListTile(
                tileColor: Colors.white,
                title: const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Contactus()));
                },
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  child: Image.asset("images/logo1.png", fit: BoxFit.contain)),
            ],
          ),
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
