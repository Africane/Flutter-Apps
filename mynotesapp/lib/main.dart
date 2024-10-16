import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotesapp/firebase_options.dart';
import 'package:mynotesapp/views/login_view.dart';
import 'package:mynotesapp/views/register_view.dart';
import 'package:mynotesapp/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/login/': (context) => const LoginView(title: 'Login',),
         '/register/': (context) => const RegisterView(title: 'Register',),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
                 options: DefaultFirebaseOptions.currentPlatform,
                ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print('You are a verified user, your email is verified');
            } else {
              return const VerifyEmailView();
            }
            } else {
              return const LoginView(title: 'Login',);
            }
            return const Text('Done');
            //if (user!.emailVerified) {
            //  return const Text('Email is verified');
            //} else {
            //  return const VerifyEmailView();
            //}
            return const LoginView(title: 'Login View',);
        default:
        return const CircularProgressIndicator();
          }
          
        },
      );
  }
}
