import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

// Login screen
class LoginView extends StatefulWidget {
  const LoginView({super.key, required String title});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
            children: [
              TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email here',
                ),
              ),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'Enter your password here',
                ),
              ),
              TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;
                  try {
                    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  devtools.log(userCredential.toString());
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      devtools.log('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      devtools.log('Wrong password provided for that user.');
                    } else if (e.code == 'invalid-email') {
                      devtools.log('Invalid email');
                    }
                  }
                },
              child: const Text('Login'),
              ),
              TextButton(
                onPressed: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/register/',
                    (route) => false,
                  );
                },
                child: const Text('Not registered yet? Register here!')
              ),
            ],
          ),
    );
  }
}

