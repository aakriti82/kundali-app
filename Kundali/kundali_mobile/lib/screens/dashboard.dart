import 'package:flutter/material.dart';
import 'kundali_form.dart';

class DashboardScreen extends StatelessWidget {
  final String token;

  DashboardScreen({required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Center(
        child: ElevatedButton(
          child: Text("Create Kundali"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => KundaliFormScreen(token: token)),
          ),
        ),
      ),
    );
  }
}
