import 'package:flutter/material.dart';

import '../../Services/api_service.dart';
 // Import API service

class OTPScreen extends StatefulWidget {
  final String email;

  const OTPScreen({Key? key, required this.email}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  // Verify OTP
  Future<void> verifyOTP() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await ApiService.verifyOTP(
        email: widget.email,
        otp: otpController.text,
      );

      // ✅ OTP verified, navigate to Home
      Navigator.pushReplacementNamed(context, 'inventory');
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  // Resend OTP
  Future<void> resendOTP() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await ApiService.resendOTP(email: widget.email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("New OTP sent to your email")),
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter the OTP sent to ${widget.email}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "OTP",
                errorText: errorMessage,
              ),
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : Column(
              children: [
                ElevatedButton(
                  onPressed: verifyOTP,
                  child: Text("Verify OTP"),
                ),
                TextButton(
                  onPressed: resendOTP,
                  child: Text("Resend OTP"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
