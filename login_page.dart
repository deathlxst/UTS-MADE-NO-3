import 'package:flutter/material.dart';
import 'success_page.dart';
import 'failure_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Login App'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_errorMessage.isNotEmpty)
            Text(
              _errorMessage,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          const SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: _login,
            child: const Text('Login'),
          ),
        ],
      ),
    ),
  );
}


  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final accounts = {
      'atom': 'neutron',
      'uncle': 'rich',
      'user': 'CE Lab',
      'anon': 'flakes',
    };
    final status = {
      'atom': 'admin',
      'uncle': 'admin',
      'user': 'user',
      'anon': 'user',
    };

    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (accounts.containsKey(username) && accounts [username] == password){
      final String role = status[username]!;
      Navigator.push(context, 
      MaterialPageRoute(builder: (_) => SuccessPage(username: username, role: role)
      ),
      );
    } else {
      Navigator.push(context,
      MaterialPageRoute(builder: (_) => FailedPage(message: 'Login Failed!')),
      );
    }
  }
}