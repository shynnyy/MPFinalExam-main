import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'reusable_widgets/reusable_widget.dart';

class Admin_Dashboard extends StatefulWidget {
  const Admin_Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AdminDashboardState();
  }
}

class _AdminDashboardState extends State<Admin_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Admin Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
