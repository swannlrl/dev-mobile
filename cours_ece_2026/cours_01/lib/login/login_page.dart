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
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
     
      body: Column(
        children: [
          const EmailField(),
          ContinueButton(onPressed: () {}),
          const OrSeparator(),
          const SocialLoginButton(
            label: 'Apple',
            iconPath: 'assets/apple_logo.svg',
            onPressed: null,
          ),
        ],
      ),
    );
  }
} 


class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Champ adresse email');
  }
}

class ContinueButton extends StatelessWidget {
  final VoidCallback? onPressed; 
  const ContinueButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return const Text('Bouton Continuer');
  }
}

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Or');
  }
}

class SocialLoginButton extends StatelessWidget {
  
  final String? label;
  final String? iconPath;
  final VoidCallback? onPressed;

  const SocialLoginButton({
    super.key, 
    this.label, 
    this.iconPath, 
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Text('Bouton Continuer avec $label');
  }
}