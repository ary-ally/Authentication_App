import 'package:flutter/material.dart';

class Contactus extends StatelessWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Image.asset("images/logo1.png", fit: BoxFit.contain),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Text(
                  "Contributors :",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.purpleAccent.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email_rounded,
                        color: Colors.red.shade400,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Aryan Sharma",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20)),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.purpleAccent.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email_rounded,
                        color: Colors.red.shade400,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Abhinav Gautam",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20)),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.purpleAccent.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email_rounded,
                        color: Colors.red.shade400,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Anvay Raj",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
