import 'package:admin_movie/user_screen.dart';
import 'package:admin_movie/widget/thongke.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'data_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA3R2QW6MtvguCtCCY0Wrt96hkL3nfah3o",
        storageBucket: "movieapp-f4f6d.appspot.com",
        projectId: "movieapp-f4f6d",
        messagingSenderId: "445881823328",
        appId: "1:445881823328:web:a5f7b90ed1691fe4a49305"),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DataScreen(),
    );
  }
}
