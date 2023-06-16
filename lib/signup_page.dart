import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_constant.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('SignUp')),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
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
                            maxLength: nameLength,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Full Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            }),
                        colDivider,
                        TextFormField(
                            maxLength: emailLength,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email address',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email address';
                              }
                              if (!EmailValidator.validate(value, true, true)) {
                                return 'Please enter valid email address';
                              }
                              return null;
                            }),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            maxLength: passwordLength,
                            obscureText: _obscured,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(_obscured
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  togglePasswordVisibility();
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              if (value.length <= 5) {
                                return 'Please enter minimum 6 chars';
                              }
                              return null;
                            }),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {}
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
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
              )),
        ));
  }

  void togglePasswordVisibility() {
    setState(() {
      _obscured = !_obscured;
    });
  }
}
