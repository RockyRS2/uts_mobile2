import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import FlutterToast
import 'dashboard.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void navigateToDashboard() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (!username.contains('@')) {
      Fluttertoast.showToast(
        msg: "harus menggunakan @",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red, 
        textColor: Colors.white, 
        fontSize: 16.0,
      );
    } else if (username.length <= 4) {
      Fluttertoast.showToast(
        msg: "username harus lebih dari 4 karakter",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (password.length <= 4) {
      Fluttertoast.showToast(
        msg: "Password harus lebih dari 4 karakter",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(username: username),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Gambar logo di atas form login
            Center(
              child: Image.asset(
                'images/logo.jpg', // Ganti dengan path logo Anda
                width: 200,
                height: 100,
              ),
            ),
            const SizedBox(height: 24), // Jarak antara logo dan form
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: navigateToDashboard,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
