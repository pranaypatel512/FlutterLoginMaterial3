import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_constant.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('SignUp')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create a new account',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 46.0),
                Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                      ),
                    ),
                    colDivider,
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email address',
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            // TODO: Implement password toggle functionality
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    // TODO: Implement login functionality
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorSeed.indigo.color,
                          ColorSeed.baseColor.color,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: const Center(
                      child: Text(
                        'SignUp',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                colDivider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                    ),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).go('/');
                        },
                        child: const Text(
                          'Login',
                        ))
                  ],
                ),
                colDivider,
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or SignUp with'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                colDivider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // TODO: Implement sign in with Google functionality
                      },
                      icon: const Icon(Icons.gpp_good),
                      label: const Text('Google'),
                    ),
                    const SizedBox(width: 10.0),
                    TextButton.icon(
                      onPressed: () {
                        // TODO: Implement sign in with Apple functionality
                      },
                      icon: const Icon(Icons.apple),
                      label: const Text('Apple'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
