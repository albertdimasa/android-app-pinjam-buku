import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pinjambuku/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Mainpage';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: Homepage(),
        ),
      );
}
