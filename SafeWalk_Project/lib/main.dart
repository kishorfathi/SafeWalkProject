import 'package:flutter/material.dart';
import 'screens/fake_call_screen.dart';
import 'services/sos_service.dart';
import 'services/voice_command_service.dart';
import 'widgets/sos_button.dart';

void main() {
  runApp(const SafeWalkApp());
}

class SafeWalkApp extends StatelessWidget {
  const SafeWalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeWalk',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final VoiceCommandService _voiceService = VoiceCommandService();

  @override
  void initState() {
    super.initState();
    _voiceService.listenForSOS(() {
      SOSService.sendSOS();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('SOS activated by voice!')),
      );
    });
  }

  @override
  void dispose() {
    _voiceService.stopListening();
    super.dispose();
  }

  void _triggerSOS() {
    SOSService.sendSOS();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('SOS activated!')),
    );
  }

  void _goToFakeCall() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FakeCallScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SafeWalk')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SOSButton(onPressed: _triggerSOS),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _goToFakeCall,
              icon: const Icon(Icons.phone),
              label: const Text('Simulate Fake Call'),
            ),
          ],
        ),
      ),
    );
  }
}