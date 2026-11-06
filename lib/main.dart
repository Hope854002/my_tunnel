import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool connected = false;
  String server = 'South Africa - Cape Town';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tunnel'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shield, size: 100, color: connected ? Colors.green : Colors.grey),
            const SizedBox(height: 20),
            Text(connected ? 'CONNECTED' : 'DISCONNECTED',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: connected ? Colors.green : Colors.red)),
            const SizedBox(height: 10),
            Text(server, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity, height: 55,
              child: ElevatedButton(
                onPressed: () => setState(() => connected = !connected),
                style: ElevatedButton.styleFrom(backgroundColor: connected ? Colors.red : Colors.green),
                child: Text(connected ? 'DISCONNECT' : 'CONNECT', style: const TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Ping: 24ms  •  Speed: Fast', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}