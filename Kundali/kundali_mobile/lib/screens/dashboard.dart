import 'package:flutter/material.dart';
import 'kundali_form.dart';

class DashboardScreen extends StatelessWidget {
  final String token;
  final String userName;
  final String userEmail;

  DashboardScreen({
    required this.token,
    this.userName = "User Name",
    this.userEmail = "user@email.com",
  });

  void _logout(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  String _greetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good Morning!";
    if (hour < 17) return "Good Afternoon!";
    return "Good Evening!";
  }

  Future<void> _refreshDashboard() async {
    // TODO: Implement refresh logic (e.g., fetch latest data)
    await Future.delayed(Duration(seconds: 1));
  }

  Widget _buildStatCard(BuildContext context, IconData icon, String label, String value) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(label),
        trailing: Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
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
              accountName: Text(userName),
              accountEmail: Text(userEmail),
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
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("New Kundali"),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => KundaliFormScreen(token: token)),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshDashboard,
        child: Padding(
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
              // Example dashboard stats
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(context, Icons.book, "Total Kundalis", "0"),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _buildStatCard(context, Icons.history, "Recent", "0"),
                  ),
                ],
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
      ),
    );
  }
}
