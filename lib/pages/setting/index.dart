import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/pages/splash/login%20page/login.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  void logoutuser ()async{
    final seasion = await SharedPreferences.getInstance();
  final logonuser = await seasion.setBool('Loginuser', false);

    if(!mounted)return;

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginpages()));



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20,horizontal: 10),
            child: Column(
              spacing: 15,
              children: [
                ListTile(
                  title: Text("Account Setting",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  title: Text("Address Book",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  title: Text("Country",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  title: Text("Currency",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  title: Text("Language",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(thickness: 3,),
                ListTile(
                  title: Text("Notification Settings",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  title: Text("Privacy Policy",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  trailing: Icon(Icons.chevron_right),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: logoutuser,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange
                    ),
                    child: Center(
                      child: Center(child: Text("Log Out",style: TextStyle(color: Colors.white,fontSize: 20),)),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
