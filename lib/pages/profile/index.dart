import 'package:flutter/material.dart';

class Profilepages extends StatefulWidget {
  const Profilepages({super.key});

  @override
  State<Profilepages> createState() => _ProfilepagesState();
}

class _ProfilepagesState extends State<Profilepages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search_rounded),
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(" My Profile",style: TextStyle(fontSize: 40,fontWeight: .bold),),
            SizedBox(height: 20,),
            ListTile(

            leading: SizedBox(
              width: 80,
              height: 80,
              child: ClipOval(
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK9a9fCxtvNDFhh3fx10P2jAaFVt7nE8a_Jpip6qPYQQ&s=10",
                  fit: BoxFit.cover,
                ),
              ),
            ),

              title:Text("AbdulSalam",style: TextStyle(fontWeight: .bold,fontSize: 30),),
              subtitle: Text("AbdulSalam3424@gmail.com",style: TextStyle(fontSize: 20,color: Colors.grey),),
            ),

            SizedBox(height: 40,),

           Column(
             children: [

               ListTile(

                   title: Text("My order",style: TextStyle(fontWeight: .bold,fontSize: 20),),
                   subtitle: Text("Already have 12 orders",style: TextStyle(fontSize: 20,color: Colors.grey),),
                   trailing: Icon(Icons.arrow_right,size: 30,color:Colors.black,),




                 ),
               SizedBox(height: 20,),
               ListTile(

                 title: Text("Shipping Addressses",style: TextStyle(fontWeight: .bold,fontSize: 20),),
                 subtitle: Text("3 address",style: TextStyle(fontSize: 20,color: Colors.grey),),
                 trailing: Icon(Icons.arrow_right,size: 30,color:Colors.black,),




               ),
               SizedBox(height: 20),
               ListTile(

                 title: Text("Payment methods",style: TextStyle(fontWeight: .bold,fontSize: 20),),
                 subtitle: Text("visa ***** 32323",style: TextStyle(fontSize: 20,color: Colors.grey),),
                 trailing: Icon(Icons.arrow_right,size: 30,color:Colors.black,),




               ),
               SizedBox(height: 20),
               ListTile(

                 title: Text("promcodes",style: TextStyle(fontWeight: .bold,fontSize: 20),),
                 subtitle: Text("you have Specails promocodes",style: TextStyle(fontSize: 20,color: Colors.grey),),
                 trailing: Icon(Icons.arrow_right,size: 30,color:Colors.black,),




               ),
               SizedBox(height:20),
               ListTile(

                 title: Text("My review",style: TextStyle(fontWeight: .bold,fontSize: 20),),
                 subtitle: Text("reviesw for 4 item ",style: TextStyle(fontSize: 20,color: Colors.grey),),
                 trailing: Icon(Icons.arrow_right,size: 30,color:Colors.black,),




               ),

             ],
           )
          ],
        ),
      ),
    );
  }
}
