import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About'),centerTitle: true,backgroundColor:Colors.purpleAccent,),
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
                  "Flutter Authentication App Made by :",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Aryan Sharma",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,fontSize: 20
                  )),
              Text("Abhinav Gautam",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,fontSize: 20
                  )),
              Text("Anvay Raj",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,fontSize: 20
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
