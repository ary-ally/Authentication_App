import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
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

    final verifyButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xFF6B75CE),
      child: MaterialButton(
        onPressed: (){
          FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text)
              .then((value) => Navigator.of(context).pop());
          Fluttertoast.showToast(msg: "link send to your email");
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