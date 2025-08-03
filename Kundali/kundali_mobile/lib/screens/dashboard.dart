import 'package:flutter/material.dart';
import 'kundali_form.dart';

class DashboardScreen extends StatelessWidget {
  final String token;

  DashboardScreen({required this.token});

  void _logout(BuildContext context) {
    // Implement your logout logic here
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("User Name"),
              accountEmail: Text("user@email.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Welcome to your Dashboard!",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Create Kundali"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => KundaliFormScreen(token: token)),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.list),
              label: Text("View Kundalis"),
              onPressed: () {
                // TODO: Implement navigation to Kundali list screen
              },
            ),
          ],
        ),
      ),
