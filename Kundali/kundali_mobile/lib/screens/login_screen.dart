import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool loading = false;
  String error = '';

  void handleLogin() async {
    setState(() => loading = true);
    final res = await ApiService.login(emailCtrl.text, passCtrl.text);

    setState(() => loading = false);

    if (res.statusCode == 200) {
      final token = jsonDecode(res.body)['token'];
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => DashboardScreen(token: token)),
      );
    } else {
      setState(() => error = res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passCtrl, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: loading ? null : handleLogin, child: Text("Login")),
            if (error.isNotEmpty) Text(error, style: TextStyle(color: Colors.red))
          ],
        ),
      ),
    );
  }
}
