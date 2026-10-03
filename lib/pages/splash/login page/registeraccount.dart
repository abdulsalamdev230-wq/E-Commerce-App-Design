import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/pages/splash/login%20page/login.dart';

class Registeraccount extends StatefulWidget {
  const Registeraccount({super.key});

  @override
  State<Registeraccount> createState() => _RegisteraccountState();
}

class _RegisteraccountState extends State<Registeraccount> {


final namecontroller=TextEditingController();
final emailcontroller= TextEditingController();
final passwordcontroller =TextEditingController();



void registeruser()async {
  final name = namecontroller.text.trim();
  final email = emailcontroller.text.trim();
  final password = passwordcontroller.text.trim();


  if (name.isEmpty || email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Kindly input your required fields"),
      ),
    );
    return;
  }


  final seasion = await SharedPreferences.getInstance();
  await seasion.setString('name', name);
  await seasion.setString('password', password);
  await seasion.setString('email', email);

  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("user account login successfully!")));


  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Loginpages()));
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: .infinity,
        height: .infinity,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical:10 ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Text("facio ",style: TextStyle(fontSize: 40,fontWeight: .bold,color: Colors.deepOrangeAccent),),
            SizedBox(height: 50),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_2_outlined),
                border: OutlineInputBorder(),
                labelText: "write your name ",

              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
                labelText: "write your email ",

              ),
            ),

            SizedBox(height: 20,),
            TextField(
              controller: passwordcontroller,

              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_clock_outlined),

                border: OutlineInputBorder(),
                labelText: "write your password ",

              ),
            ),


            SizedBox(height: 30),
            GestureDetector(
              onTap: registeruser,

              child: Container(
                width: .infinity,
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                decoration: BoxDecoration(color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Center(child: Text("sign up" ,style: TextStyle(color: Colors.white,fontWeight: .bold,fontSize: 20),)),

              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: registeruser,

              child: Row(
                mainAxisAlignment:.center,
                children: [




                  Text(" I have already account?",style: TextStyle(fontSize: 10,fontWeight: .w200,color: Colors.deepOrange),),

                ],
              ),
            )


          ],



        ),
      ),
    );
  }
}
