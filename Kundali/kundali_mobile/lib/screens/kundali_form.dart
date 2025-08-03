import 'package:flutter/material.dart';
import '../services/api_service.dart';

class KundaliFormScreen extends StatefulWidget {
  final String token;

  KundaliFormScreen({required this.token});

  @override
  _KundaliFormScreenState createState() => _KundaliFormScreenState();
}

class _KundaliFormScreenState extends State<KundaliFormScreen> {
  final nameCtrl = TextEditingController();
  final dobCtrl = TextEditingController();
  String message = "";

  void submitForm() async {
    final data = {
      "name": nameCtrl.text,
      "dob": dobCtrl.text,
    };

    final res = await ApiService.createKundali(data, widget.token);

    setState(() {
      message = res.statusCode == 200
          ? "✅ Kundali created successfully"
          : "❌ Failed: ${res.body}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kundali Form")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: dobCtrl, decoration: InputDecoration(labelText: "DOB (YYYY-MM-DD)")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: submitForm, child: Text("Submit")),
            if (message.isNotEmpty) Text(message),
          ],
        ),
      ),
    );
  }
}
