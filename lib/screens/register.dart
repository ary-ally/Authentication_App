import 'package:authentication_app/screens/mobile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart'; //authentication 
import 'package:cloud_firestore/cloud_firestore.dart'; //cloud_firestore
import 'package:authentication_app/model/user_model.dart'; 

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  String? _character = "male";
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  var size,height,width;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController addController = TextEditingController();

  String dropdownvalue1 = 'I';
  var items1 = [
    'I',
    'II',
    'III',
    'IV',
  ];

  String dropdownvalue2 = 'CSE';
  var items2 = [
    'CSE',
    'CSE (AI & ML)',
    'CSE (DS)',
    'CS',
    'CS & IT',
    'IT',
    'ECE',
    'EEE',
    'ME',
    'CIVIL',
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

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
      textInputAction: TextInputAction.next
      ,);

    final nameField=TextFormField(
      autofocus: false,
      controller: nameController,
      validator: (value) {
      RegExp regex = RegExp(r'^.{3,}$');
      if (value!.isEmpty) {
        return ("Name cannot be Empty");
      }
      if (!regex.hasMatch(value)) {
        return ("Enter Valid name(Min. 3 Character)");
      }
      return null;
    },
      onSaved: (value)
      {
        nameController.text= value!;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),

      textInputAction: TextInputAction.next,);

    final rollField=TextFormField(
      autofocus: false,
      controller: rollController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex = RegExp(r'^.{12,}$');
        if (value!.isEmpty) {
          return ("roll no. cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid roll no.(Min. 12 numbers)");
        }
        return null;
      },
      onSaved: (value)
      {
        rollController.text= value!;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.adjust_outlined),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Roll Number",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),

      textInputAction: TextInputAction.next,);

    final addField=TextFormField(
      autofocus: false,
      controller: addController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("address cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid address(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value)
      {
        addController.text= value!;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_balance),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Address",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),

      textInputAction: TextInputAction.next,);



    final registerButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xFF6B75CE),
      child: MaterialButton(
        onPressed: (){
          signUp(emailController.text, passwordController.text);
        },
        child: const Text("Register", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bgscreen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 35,right: 35,top: 0),
              child: Form(
                key:_formkey ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height:150,
                      child: Center(child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w300),)),
                    ),
                    const SizedBox(height: 25,),
                    nameField,
                    const SizedBox(height: 25,),
                    rollField,
                    const SizedBox(height: 25,),
                    emailField,
                    const SizedBox(height: 25,),
                    passwordField,
                    const SizedBox(height: 25,),
                    addField,
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only (top:10 ,left: 20),
                        child: Row(children: [
                          Radio<String>(
                            value: "male",
                            groupValue: _character,
                            onChanged: (value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          const Text('male',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                        ]
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 100),
                        child: Row(children: [
                          Radio<String>(
                            value: "female",
                            groupValue: _character,
                            onChanged: (value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          const Text('female',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                        ],),
                      ),
                    ],
                    ),
                    Row(children: <Widget>[
                      Row(children: [
                        const Text('Current Year : ', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                        DropdownButton(
                          dropdownColor: const Color(0xFFBEC3FC),
                          // Initial Value
                          value: dropdownvalue1,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items1.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue1 = newValue!;
                            });
                          },
                        ),
                      ],),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(children: <Widget>[
                          const Text('Branch : ', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                          DropdownButton(
                            dropdownColor: const Color(0xFFBEC3FC),
                            // Initial Value
                            value: dropdownvalue2,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items2.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue2 = newValue!;
                              });
                            },
                          ),
                        ],
                        ),
                      ),
                    ],),
                    const SizedBox(height: 35,),
                    registerButton,


                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        (error.code);
      }
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameController.text;
    userModel.roll = rollController.text;
    userModel.add = addController.text;
    userModel.gender = _character.toString();
    userModel.year = dropdownvalue1.toString();
    userModel.branch = dropdownvalue2.toString();

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Moving Forward");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const Mobile()),
            (route) => false);
  }
}


