import 'package:firebase_auth/firebase_auth.dart';

class OTPService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to verify phone number
  Future<void> verifyPhoneNumber(
      String phoneNumber,
      Function(PhoneAuthCredential) verificationCompleted,
      Function(FirebaseAuthException) verificationFailed,
      Function(String, int?) codeSent,
      Function(String) codeAutoRetrievalTimeout) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  // Function to sign in with phone auth credential
  Future<User?> signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final UserCredential authResult =
          await _auth.signInWithCredential(phoneAuthCredential);
      return authResult.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
