import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

String adminEmail = '';
String adminPass = '';

allowAdminToLogin() async {
  User? currentAdmin;
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: adminEmail, password: adminPass,).then((fAuth) {
    currentAdmin = fAuth.user;
  }).catchError((onError) {
    final snackbar = SnackBar(
      content: Text(
        "Error Occured :" + onError.toString(),
        style: const TextStyle(fontSize: 36,),
      ),backgroundColor: Colors.blueAccent,
    );
  });
      }

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/123.png"),
                  SizedBox(height: 15),

                  //email textfield
                  TextField(
                    onChanged: (value) {
                      adminEmail = value;
                    },
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.greenAccent,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ),
                        ),
                        hintText: "email",
                        hintStyle: TextStyle(color: Colors.black12),
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.blueAccent,
                        )),
                  ),
                  const SizedBox(height: 10),
                  //pass textfield
                  TextField(
                    onChanged: (value) {
                      adminPass = value;
                    },
                    obscureText: true,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.greenAccent,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black12),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.blueAccent,
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {},

                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 2.5),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
