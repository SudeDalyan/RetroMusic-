import 'package:flutter/material.dart';
import 'homepage.dart';
import 'login.dart';
import 'register.dart';
import 'welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Retro Studios',
        home: WelcomePage(),
        routes: {
        'register': (context) => MyRegister(),
        'login': (context) => MyLogin(),
        'homepage': (context) => MyHomePage(),
        }
      ),
    );
  }
}
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MyHomePage();
    }
    return MyLogin();
  }
}
