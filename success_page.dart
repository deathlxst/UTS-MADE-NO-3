import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String username;
  final String role;

  const SuccessPage({
    Key? key,
    required this.username,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Successful with username: $username and role: $role',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}