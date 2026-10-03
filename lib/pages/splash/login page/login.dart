
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/main.dart';
import 'package:testing/pages/splash/login%20page/registeraccount.dart';

class Loginpages extends StatefulWidget {
const Loginpages({super.key});

@override
State<Loginpages> createState() => _LoginpagesState();
}

class _LoginpagesState extends State<Loginpages> {
final emailController = TextEditingController();
final passController = TextEditingController();

// Login function
Future<void> loginUser() async {
final email = emailController.text.trim();
final password = passController.text.trim();

// Empty fields check
if (email.isEmpty || password.isEmpty) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("Please input email & password"),
),
);
return;
}

// SharedPreferences
final session = await SharedPreferences.getInstance();

// Saved email & password
final savedEmail = session.getString('email');
final savedPassword = session.getString('password');

// Check login
if (email == savedEmail && password == savedPassword) {

// ⭐ Save login session
await session.setBool('Loginuser', true);

if (!mounted) return;

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("Login successfully!"),
),
);

// Go to HomePage
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (context) => HomePage(),
),
);

} else {
if (!mounted) return;

ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("Email or password is incorrect"),
),
);
}
}

@override
void dispose() {
emailController.dispose();
passController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 10,
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [

// Logo / App name
const Text(
"facio",
style: TextStyle(
fontSize: 40,
fontWeight: FontWeight.bold,
color: Colors.deepOrangeAccent,
),
),

const SizedBox(height: 50),

// Email
TextField(
controller: emailController,
keyboardType: TextInputType.emailAddress,
decoration: const InputDecoration(
prefixIcon: Icon(Icons.email_outlined),
border: OutlineInputBorder(),
labelText: "Write your email",
),
),

const SizedBox(height: 20),

// Password
TextField(
controller: passController,
obscureText: true,
decoration: const InputDecoration(
prefixIcon: Icon(Icons.lock_outline),
border: OutlineInputBorder(),
labelText: "Write your password",
),
),

const SizedBox(height: 20),

// Forgot password
Row(
mainAxisAlignment: MainAxisAlignment.end,
children: const [
Text(
"Forget password?",
style: TextStyle(
fontWeight: FontWeight.bold,
color: Colors.deepOrangeAccent,
),
),
],
),

const SizedBox(height: 30),

// Login button
GestureDetector(
onTap: loginUser,
child: Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(
horizontal: 30,
vertical: 10,
),
decoration: BoxDecoration(
color: Colors.deepOrange,
borderRadius: BorderRadius.circular(20),
),
child: const Center(
child: Text(
"Login",
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 20,
),
),
),
),
),

const SizedBox(height: 20),

// Create account
GestureDetector(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => Registeraccount(),
),
);
},
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: const [
Text("I haven't created an account? "),
Text(
"Create account",
style: TextStyle(
fontSize: 12,
fontWeight: FontWeight.bold,
color: Colors.deepOrange,
),
),
],
),
),
],
),
),
);
}
}
