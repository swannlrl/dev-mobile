import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return SizedBox(
      width: double.infinity, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2B8DA4), 
          foregroundColor: Colors.white,           
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), 
          ),
        ),
        child: const Text(
          'Continuer',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
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
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Bouton Continuer avec $label');
  }
}