import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Tacuara',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xFF1B5E20),
          seedColor: const Color(0xFF1B5E20),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Sign up page"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: size.height * 0.02),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: size.height * 0.04),
              OutlinedButton(
                child: const Text("Sign up"),
                onPressed: () async {
                  //await signUp(email: email, password: password);
                  await login(email: email, password: password);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
    }
  }

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
    }
  }
}
