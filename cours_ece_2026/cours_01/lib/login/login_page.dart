import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";

  bool get canContinue => email.trim().isNotEmpty; // simple : pas vide

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log in or sign up',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            EmailField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),

            const SizedBox(height: 20),

            ContinueButton(
              enabled: canContinue,
              onPressed: canContinue
                  ? () {
                      print("Continue pressed with email: $email");
                    }
                  : null,
            ),

            const SizedBox(height: 30),

            const OrDivider(),

            const SizedBox(height: 30),


            ContinuerWithBouton(
              text: 'Apple',
              iconPath: 'assets/apple_logo.svg',
              onPressed: () => print('Apple pressed'),
            ),
            const SizedBox(height: 16),
            ContinuerWithBouton(
              text: 'Google',
              iconPath: 'assets/google_logo.svg',
              onPressed: () => print('Google pressed'),
            ),
            const SizedBox(height: 16),
            ContinuerWithBouton(
              text: 'Facebook',
              iconPath: 'assets/facebook_logo.svg',
              onPressed: () => print('Facebook pressed'),
            ),
          ],
        ),
      ),
    );
  }
}


class EmailField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const EmailField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        hintText: 'Email Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}


class ContinueButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool enabled;

  const ContinueButton({
    super.key,
    required this.enabled,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 56,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: enabled
              ? const Color(0xFF2B8C9A) 
              : Colors.grey.shade400,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: const Text('Continue'),
      ),
    );
  }
}


class ContinuerWithBouton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;

  const ContinuerWithBouton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFFCBD5E1)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
                allowDrawingOutsideViewBox: true,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  'Continue with $text',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 22),
            ],
          ),
        ),
      ),
    );
  }
}


class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(),
        ),

        const SizedBox(width: 10),

        Text(
          'Or',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary, // textSecondary
          ),
        ),

        const SizedBox(width: 10),

        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
