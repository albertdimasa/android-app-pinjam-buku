import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinjambuku/login_page.dart';
import 'package:pinjambuku/pages/profile.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Profile();
            } else if (snapshot.hasError) {
              return Center(child: Text('Somehting went wrong'));
            } else {
              return LoginPage();
            }
          },
        ),
      );
}
