import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:convert';

class KundaliListScreen extends StatefulWidget {
  final String token;

  KundaliListScreen({required this.token});

  @override
  _KundaliListScreenState createState() => _KundaliListScreenState();
}

class _KundaliListScreenState extends State<KundaliListScreen> {
  List kundalis = [];
  bool loading = true;

  void fetchData() async {
    final res = await ApiService.getKundalis(widget.token);
    if (res.statusCode == 200) {
      setState(() {
        kundalis = jsonDecode(res.body);
        loading = false;
      });
    } else {
      setState(() => loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kundali List")),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: kundalis.length,
              itemBuilder: (context, index) {
                final k = kundalis[index];
                return ListTile(
                  title: Text(k['name'] ?? 'Unknown'),
                  subtitle: Text("DOB: ${k['dob']}"),
                );
              },
            ),
    );
  }
}
