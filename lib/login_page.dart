import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pinjambuku/provider/google_sign_in.dart';
import 'package:pinjambuku/widget/widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Logo
            Padding(
              padding: const EdgeInsets.only(top: 130, bottom: 15),
              child: Image(
                image: AssetImage(
                  'assets/Icon/Logo_Small.png',
                ),
                height: 80,
              ),
            ),

            //Email Box
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.black87,
                  ),
                  hintText: 'Email',
                  hintStyle: textPlaceholder,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            //Password Box
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20, top: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.password,
                    color: Colors.black87,
                  ),
                  hintText: 'Password',
                  hintStyle: textPlaceholder,
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),

            //Button Login dan Lupa Password
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                width: 320,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.orange.shade700),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: textButton,
                  ),
                ),
              ),
            ),
            Text('Lupa password?', style: textNormal2),

            //Button Login Google
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: SignInButton(
                Buttons.GoogleDark,
                text: "Login dengan email UISI",
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
              ),
            ),

            //Text belum punya akun
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum punya akun?', style: textNormal),
                Text(
                  'Daftar disini',
                  style: textNormal2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
