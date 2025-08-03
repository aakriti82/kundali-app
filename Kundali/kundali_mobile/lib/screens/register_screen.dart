import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  String message = "";
  bool loading = false;

  void handleRegister() async {
    setState(() => loading = true);
    final res = await ApiService.register({
      "name": nameCtrl.text,
      "email": emailCtrl.text,
      "password": passCtrl.text
    });

    setState(() => loading = false);

    if (res.statusCode == 200) {
      setState(() => message = "✅ Registered successfully. Redirecting to login...");
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    } else {
      setState(() => message = "❌ ${res.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: emailCtrl, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passCtrl, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: loading ? null : handleRegister, child: Text("Register")),
            if (message.isNotEmpty) Text(message),
          ],
        ),
      ),
    );
  }
}
