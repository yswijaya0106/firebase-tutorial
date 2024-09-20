import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_tutorial/pages/login/login.dart';
<<<<<<< HEAD
import 'package:firebase_tutorial/pages/signup/signup.dart';
=======
>>>>>>> bf1ba5d9ee043da03fe118b3cdfb2226be0f0ad1
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

<<<<<<< HEAD
=======
  // This widget is the root of your application.
>>>>>>> bf1ba5d9ee043da03fe118b3cdfb2226be0f0ad1
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
<<<<<<< HEAD
      home: const HomePage(),
=======
      home: LoginPage(),
>>>>>>> bf1ba5d9ee043da03fe118b3cdfb2226be0f0ad1
    );
  }
}

<<<<<<< HEAD
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    LoginPage(),
    SignUpPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Sign Up',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
=======

>>>>>>> bf1ba5d9ee043da03fe118b3cdfb2226be0f0ad1
