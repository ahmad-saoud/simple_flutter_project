import 'dart:ffi';
import 'package:myproject/HomePage.dart';
import 'package:myproject/Signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey();
  late String? phonenumber ;
  late String? password ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LogIn", style: TextStyle(fontSize: 25)) , centerTitle: true,),
      body: Center(

        child:SingleChildScrollView(child : Container( height: 600 , decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)),color: Colors.yellow) ,child: Form(

            key: formkey,
            child: SingleChildScrollView(child :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.login , size: 100,) ,
                Text(
                  "please enter your phone number : ",
                  style: TextStyle(fontSize: 20 ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value){
                    if(value!.length < 10 ||value.length > 10 ){
                      return "phone number must be ten characters" ;
                    }

                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    hint: Text("phone number"),

                  ),
                  onSaved: (value){
                    if(formkey.currentState!.validate()) {
                      phonenumber = value;
                    }
                  },
                ),
                Text(
                  "please enter your password : ",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value){
                    if(value!.length < 8){
                      return "password should be at least eight characters";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    hint: Text("password"),

                  ),
                  onSaved: (value){
                    if(formkey.currentState!.validate()) {
                      password = value;
                    }
                  }
                  ,
                ),
                Text("") ,
                Container( width: 100 , height: 40, child:MaterialButton(  color: Colors.blue , onPressed: (){
                  if(formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    formkey.currentState!.reset();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage())) ;
                  }

                } , child: Text("log in "),)
                  ,) ,
                Row(
                  children: [
                    Expanded(flex: 3 , child: Text("you don't have an account ? "  ,style: TextStyle(fontSize: 20),) , ) ,
                    Expanded(child: MaterialButton(onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignIn())) ;
                    } , child: Text("sign in"),) ,)
                  ],
                )
              ],
            ), )
        ), ))
      ),
    );
  }
}
