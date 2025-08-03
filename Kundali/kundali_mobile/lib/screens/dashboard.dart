import 'package:flutter/material.dart';
import 'kundali_form.dart';

class DashboardScreen extends StatelessWidget {
  final String token;

  DashboardScreen({required this.token});

  void _logout(BuildContext context) {
    // Implement your logout logic here
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  String _greetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good Morning!";
    if (hour < 17) return "Good Afternoon!";
    return "Good Evening!";
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
              _greetingMessage(),
              style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Welcome to your Dashboard!",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 24),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.add, color: Theme.of(context).primaryColor),
                title: Text("Create Kundali"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => KundaliFormScreen(token: token)),
                ),
              ),
            ),
            SizedBox(height: 12),
            Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.list, color: Theme.of(context).primaryColor),
                title: Text("View Kundalis"),
                onTap: () {
                  // TODO: Implement navigation to Kundali list screen
                },
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Recent Activity",
              style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 1,
              child: ListTile(
                leading: Icon(Icons.history),
                title: Text("No recent activity"),
              ),
            ),
          ],
        ),
      ),
    );
  }