import 'package:flutter/material.dart';
import 'second_page.dart';
import 'sign_up_page.dart';  
import 'forgot_password_page.dart';  

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
      );
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Please enter both username and password.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[600],
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to SignUpPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: const Text('Sign-Up'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to ForgotPasswordPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: const Text('I forgot my password'),
            ),
          ],
        ),
      ),
    );
  }
}
