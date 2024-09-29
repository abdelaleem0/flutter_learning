import 'package:flutter/material.dart';
import 'dart:async';

class UserStatusScreen extends StatefulWidget {
  const UserStatusScreen({super.key});

  @override
  _UserStatusScreenState createState() => _UserStatusScreenState();
}

class _UserStatusScreenState extends State<UserStatusScreen> {
// you must make broadcast_stream when multiple widgets need to listen for same listener .
//  if you used single stream this will make error because "Stream has already been listened to."
//  you can listen to same stream another one
  final StreamController<String> _statusController =
      StreamController<String>.broadcast();
  String _currentStatus = "Offline";

  @override
  void dispose() {
    _statusController.close();
    super.dispose();
  }

  void _updateStatus(String status) {
    setState(() {
      _currentStatus = status;
    });
    _statusController.add(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Status Example')),
      body: Column(
        children: [
          StatusDisplay(statusStream: _statusController.stream),
          StatusDisplay(statusStream: _statusController.stream),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _updateStatus("Online"),
                  child: const Text('Set Online'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _updateStatus("Busy"),
                  child: const Text('Set Busy'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _updateStatus("Offline"),
                  child: const Text('Set Offline'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatusDisplay extends StatelessWidget {
  final Stream<String> statusStream;

  StatusDisplay({required this.statusStream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: statusStream,
      builder: (context, snapshot) {
        return ListTile(
          title: Text('User Status: ${snapshot.data ?? "Unknown"}'),
        );
      },
    );
  }
}
