import 'package:flutter/material.dart';
import 'Signup.dart';
import 'package:puma/Lecturer_Dashboard.dart';
import 'package:puma/Student_Dashboard.dart';
import 'package:puma/Admin_Dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  String email = '';
  String password = '';
  int loginAttempts = 0; // Track login attempts.

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void onChangedUsername(String value) {
    setState(() {
      email = value;
    });
  }

  void onChangedPassword(String value) {
    setState(() {
      password = value;
    });
  }

  Future<void> onPressedSignIn() async {
    if (loginAttempts >= 3) {
      const snackBar = SnackBar(
          content: Text('You have been locked out! Please try again later.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (email.isEmpty || password.isEmpty) {
      const snackBar =
          SnackBar(content: Text('Please provide email and password'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // Mock login logic for display purposes
    if (email == "admin@example.com" && password == "admin123") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Admin_Dashboard()));
    } else if (email == "lecturer@example.com" && password == "lecturer123") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Lecture_Dashboard()));
    } else if (email == "student@example.com" && password == "student123") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Student_Dashboard()));
    } else {
      loginAttempts++;
      const snackBar =
          SnackBar(content: Text('Email or Password is incorrect!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void onPressedSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Signup()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style:
              TextStyle(color: Colors.red), // Text color for the AppBar title
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue, // AppBar background color
      ),
      body: Container(
        color: Colors.blue, // Background color for the body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
                labelStyle:
                    TextStyle(color: Colors.red), // Text color for the label
              ),
              style: const TextStyle(color: Colors.red), // Text color for input
              onChanged: onChangedUsername,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              onChanged: onChangedPassword,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
                labelStyle:
                    TextStyle(color: Colors.red), // Text color for the label
              ),
              style: const TextStyle(color: Colors.red), // Text color for input
            ),
            ElevatedButton(
              onPressed: onPressedSignIn,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button background color
              ),
              child:
                  const Text('Sign In', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: onPressedSignUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button background color
              ),
              child:
                  const Text('Sign Up', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
