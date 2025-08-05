import 'package:flutter/material.dart';

class FakeCallScreen extends StatelessWidget {
  const FakeCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Incoming Call", style: TextStyle(fontSize: 30, color: Colors.white)),
            const SizedBox(height: 30),
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            const Text("Mom", style: TextStyle(fontSize: 24, color: Colors.white)),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.call_end, color: Colors.red, size: 50),
                Icon(Icons.call, color: Colors.green, size: 50),
              ],
            )
          ],
        ),
      ),
    );
  }
}