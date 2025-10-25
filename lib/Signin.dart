

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/Login.dart';
import 'package:myproject/HomePage.dart';

class SignIn extends StatefulWidget {
  const SignIn ({super.key}) ;
  @override
  State<SignIn> createState() {
    return _SignInState() ;
  }
}
class _SignInState extends State<SignIn>{
  late String ?  phonenumber ;
  late String ?  password ;
  late String ?  confirmPassword ;
  GlobalKey<FormState> formkey = GlobalKey() ;
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(title: Text("SignIn", style: TextStyle(fontSize: 25)) , centerTitle: true,),
      body: Center(

        child: SingleChildScrollView(child :Container(  height: 700 , decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)),color: Colors.yellow) , child :Form(

          key: formkey,
          child: Column(

            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.handshake_outlined , size: 100,) ,

              Text(
                "please enter your phone number : ",
                style: TextStyle(fontSize: 20),
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
                  phonenumber = value ;
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
                  password = value ;
                }
                ,
              ),
              Text(
                "please confirm your password : ",
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
                  hint: Text("confirm password"),

                ),
                onSaved: (value){
                  confirmPassword = value ;
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

              } , child: Text("sign in "),)
                ,) ,
              Row(
                children: [
                  Expanded(flex: 3 , child: Text("you have an account ? "  ,style: TextStyle(fontSize: 20),) , ) ,
                  Expanded(child: MaterialButton(onPressed: (){
                    Navigator.of(context).pushReplacement(  MaterialPageRoute(builder:(context)=> Login())) ;
                  } , child: Text("log in"),) ,)
                ],
              )
            ],
          ),
        ), ) )
      ),
    );

  }
}