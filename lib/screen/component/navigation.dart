import 'package:flutter/material.dart';
import 'package:firebase_tutorial/screen/pages/signup/signup.dart'; // Import the SignUpPage
import 'package:firebase_tutorial/screen/pages/signup/signup_otp.dart';
import 'package:firebase_tutorial/screen/pages/login/login.dart';
import 'package:firebase_tutorial/screen/pages/home/home.dart'; // Add your home page

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Track the current selected index

  // Function to update the index based on item tapped
  void _onItemTapped(int index) {
    print("Tapped index: $index"); // Print index to debug
    if (index == 0) {
      Navigator.of(context).pushReplacementNamed('/login');
    } else if (index == 1) {
      Navigator.of(context).pushReplacementNamed('/signup');
    } else if (index == 3) {
      Navigator.of(context).pushReplacementNamed('/otp');
    } else {
      setState(() {
        _selectedIndex = index; // Update the selected index for other pages
      });
    }
  }

  // Function to return the correct widget based on the selected index
  Widget _getSelectedPage() {
    switch (_selectedIndex) {
      case 1:
        return SignUpPage(); // Return SignUpPage for index 1
      case 2:
        return HomePage(); // Return HomePage for index 2
      case 3:
        return SignUpOTPPage(); // Return SignUpOTPPage for index 3
      default:
        return HomePage(); // Default to HomePage
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Example'),
      ),
      body: _getSelectedPage(), // Display the selected page content
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Pass function to update index
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.login), // Icon for Login
          label: 'Login',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.app_registration), // Icon for Register
          label: 'Register',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home), // Icon for Home
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.verified_user), // Icon for OTP
          label: 'SignUp OTP',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.amber[800], // Highlight selected item
      unselectedItemColor: Colors.grey, // Color for unselected items
      onTap: (index) {
        onItemTapped(index); // Trigger function when an item is tapped
      },
    );
  }
}
