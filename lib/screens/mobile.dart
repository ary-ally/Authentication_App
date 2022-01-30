import 'package:authentication_app/screens/otp.dart';
import 'package:flutter/material.dart';


class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}


class _MobileState extends State<Mobile> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final phoneField=TextFormField(
      autofocus: false,
      controller: phoneNumber,
      keyboardType: TextInputType.phone,
      onSaved: (value)
      {
        phoneNumber.text= value!;
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.add_ic_call),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          )
      ),

      textInputAction: TextInputAction.next,);


    final verifyButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xFF6B75CE),
      child:  MaterialButton(
        onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context)
              => OTPScreen(phoneNumber.text),
              ),
            );
        },
        child: const Text("Send OTP", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
      ));

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
                      child: Center(child: Text("Verify Phone Number",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.w300,),)),
                    ),
                    const SizedBox(height: 65,),
                    phoneField,
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

