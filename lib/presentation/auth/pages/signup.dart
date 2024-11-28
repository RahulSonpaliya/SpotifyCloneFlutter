import 'package:flutter/material.dart';
import 'package:spotify_clone/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/presentation/auth/pages/login.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        showLogo: true,
        showBackButton: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Do you have an account?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginPage(),
                  ),
                );
              },
              child: const Text(
                'Sign In',
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          children: [
            const Text(
              'Register',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _fullNameCtrl,
              decoration: const InputDecoration(
                hintText: 'Full Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(
                hintText: 'Enter Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
              onPressed: () {},
              title: 'Create Account',
            )
          ],
        ),
      ),
    );
  }
}
