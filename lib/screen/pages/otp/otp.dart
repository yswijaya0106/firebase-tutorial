import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/services/otp_service.dart';
import 'package:firebase_tutorial/screen/pages/home/home.dart';

class OTPVerificationPage extends StatelessWidget {
  final String verificationId;
  final OTPService _otpService = OTPService();
  final TextEditingController _otpController = TextEditingController();

  OTPVerificationPage({required this.verificationId});

  void _signInWithOTP(BuildContext context) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: _otpController.text,
    );
    User? user = await _otpService.signInWithPhoneAuthCredential(credential);
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "CODE",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "VERIFICATION",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Enter the verification code sent at",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "your phone number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {
                  // Handle value changes if needed
                },
                controller: _otpController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _signInWithOTP(context),
                child: Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
