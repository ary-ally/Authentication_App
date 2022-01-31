import 'package:authentication_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Emailedit extends StatefulWidget {
  const Emailedit({Key? key}) : super(key: key);

  @override
  _EmaileditState createState() => _EmaileditState();
}


class _EmaileditState extends State<Emailedit> {

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
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    final emailField=TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value)
      {
        emailController.text= value!;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),

      textInputAction: TextInputAction.next,);

    final passwordField=TextFormField(

      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex =  RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value)
      {
        passwordController.text= value!;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),
      textInputAction: TextInputAction.done,);

    final verifyButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xFF6B75CE),
      child: MaterialButton(
        onPressed: (){

        },
        child: const Text("Reset", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      ),);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Form(
              key:_formkey ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height:150,
                    child: Center(child: Text("Set New Password",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w300,),)),
                  ),
                  const SizedBox(height: 65,),
                  emailField,
                  const SizedBox(height: 65,),
                  passwordField,
                  const SizedBox(height: 35,),
                  verifyButton,



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}