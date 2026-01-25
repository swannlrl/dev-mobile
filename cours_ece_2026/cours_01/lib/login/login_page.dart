import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in or sign up',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // Couleur noir
            fontSize: 32, // Taille 
            fontWeight: FontWeight.bold,//
          ),
        ),
      ),
    );
  }
}