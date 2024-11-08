import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';
import 'dart:async';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  List<String> otpCode = ['', '', '', ''];
  int _resendCodeTimer = 45; // Timer for resend code
  Timer? _timer;
  Color blue = const Color.fromRGBO(54, 40, 221, 1.0);

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  void startResendTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendCodeTimer > 0) {
        setState(() {
          _resendCodeTimer--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleOtpInput(int index, String value) {
    setState(() {
      otpCode[index] = value;
      if (value.isNotEmpty && index < 3) {
        // Move focus to the next field
        FocusScope.of(context).nextFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20.0, left: 30, right: 30, bottom: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'OTP Code Verification',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Icon(Icons.verified_outlined, color: blue, size: 24),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'We have sent an OTP to your email i********@ymail.com,\nEnter the OTP code below to verify',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: blue, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    onChanged: (value) {
                      _handleOtpInput(index, value);
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                // Logic for resending code
                onTap: () {
                  Navigator.pushNamed(context, newPassword);
                },
                child: const Text(
                  "Didn't receive email?",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Code has been resent'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  'Resend code in $_resendCodeTimer s',
                  style: TextStyle(fontSize: 14, color: blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
