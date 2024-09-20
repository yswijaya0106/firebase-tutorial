import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_tutorial/navigation.dart';
import 'package:firebase_tutorial/services/otp_service.dart';
import 'package:firebase_tutorial/screen/pages/otp/otp.dart';

class SignUpOTPPage extends StatefulWidget {
  @override
  _SignUpPageOTPState createState() => _SignUpPageOTPState();
}

class _SignUpPageOTPState extends State<SignUpOTPPage> {
  final OTPService _otpService = OTPService();
  final TextEditingController _phoneController = TextEditingController();
  String? _verificationId;
  int _selectedIndex = 0;

  void _verifyPhoneNumber() {
    _otpService.verifyPhoneNumber(
      _phoneController.text,
      (PhoneAuthCredential credential) async {
        User? user =
            await _otpService.signInWithPhoneAuthCredential(credential);
        if (user != null) {
          print('Successfully signed in: ${user.uid}');
        }
      },
      (FirebaseAuthException e) {
        print('Failed to verify phone number: ${e.message}');
      },
      (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                OTPVerificationPage(verificationId: verificationId),
          ),
        );
      },
      (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                OTPVerificationPage(verificationId: verificationId),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get On Board'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/signup_image.svg'),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone No',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _verifyPhoneNumber,
                child: Text('Verify Phone Number'),
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
