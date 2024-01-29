import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final String userEmail;

  HomePage(this.userEmail);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $userEmail!'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Adaugă aici funcționalitățile pentru a realiza alte acțiuni pe această pagină
              },
              child: Text('Perform Action'),
            ),
          ],
        ),
      ),
    );
  }
}
