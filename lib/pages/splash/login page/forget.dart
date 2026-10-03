import 'package:flutter/material.dart';


class Forgetpage extends StatelessWidget {
  const Forgetpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepOrange,

      body: Container(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        width: .infinity,
        height: .infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(crossAxisAlignment: .center,
          mainAxisAlignment: .center,

          children: [
            Text(" facio",style: TextStyle(fontWeight: .bold,fontSize: 30),),
            SizedBox(height: 20,),
            TextField(
             decoration: InputDecoration(
               labelText: "write to email",
               prefixIcon: Icon(Icons.email_outlined),
               border: OutlineInputBorder(),
             ),
            ),
            SizedBox(height: 20,),
           Container(
             color:Colors.deepOrange,
             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
             child: Text("forget password"),
           )





          ],
        ),
      ),
    );
  }
}
