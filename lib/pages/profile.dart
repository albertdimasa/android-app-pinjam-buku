import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinjambuku/pages/dashboard.dart';
import 'package:pinjambuku/provider/google_sign_in.dart';
import 'package:pinjambuku/widget/widget.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user =
        FirebaseAuth.instance.currentUser!; //Get user yang login saat ini

    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat datang!'),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Profil
              Text('Profil', style: bookTitle3),
              SizedBox(
                height: 15,
              ),

              //Gambar Profil
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(height: 25),

              //Nama Pengguna
              Text(
                user.displayName!,
                style: textNormal2,
              ),
              SizedBox(height: 8),

              //Email
              Text(
                user.email!,
                style: textNormal2,
              ),
              SizedBox(height: 20),

              //Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Button Dashboard
                  TextButton.icon(
                      label: Text(
                        'Dashboard',
                        style: textButton2,
                      ),
                      icon: Icon(Icons.dashboard),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue.shade900,
                        onSurface: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      }),
                  SizedBox(width: 25),

                  //Button Logout
                  TextButton.icon(
                      label: Text(
                        'Logout',
                        style: textButton2,
                      ),
                      icon: Icon(Icons.logout),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.orange.shade900,
                        onSurface: Colors.black,
                      ),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.logout();
                      }),
                ],
              )
            ],
          )),
    );
  }
}
