import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/services/auth_service.dart';
import 'package:firebase_tutorial/screen/pages/login/login.dart';
import 'package:firebase_tutorial/navigation.dart';

class SignUpPage extends StatelessWidget {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _selectedIndex = 0;

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Image.network(
                'https://miro.medium.com/v2/resize:fit:1400/1*YyeW02-s7i19u58nW4A-yg.png',
                height: 150,
              ),
              const SizedBox(height: 50),
              // Email TextField
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              // Password TextField
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              // Sign Up Button
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  try {
                    User? user = await _authService
                        .registerWithEmailAndPassword(email, password);
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          Navigator.of(context).pushReplacementNamed(
            index == 0
                ? '/login'
                : index == 1
                    ? '/signup'
                    : index == 3
                        ? '/otp'
                        : '/',
          );
        },
      ),
    );
  }
}
