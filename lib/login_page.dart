import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscured = true;

  bool isNonModalBottomSheetOpen = false;
  PersistentBottomSheetController<void>? _nonModalBottomSheetController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Builder(builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground.withAlpha(8),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                            image:
                                NetworkImage('https://picsum.photos/536/354'),
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    colDivider,
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0)),
                    const Text(
                      'Please enter your email and password',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 46.0),
                    Column(
                      children: [
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
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            maxLength: passwordLength,
                            obscureText: _obscured,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
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
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                //GoRouter.of(context).go("/forgotpassword");
                                showModalBottomSheet(
                                  showDragHandle: true,
                                  elevation: 20,
                                  isDismissible: false,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.background,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Text('Forgot Password',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge),
                                          ),
                                          colDivider,
                                          const Text(
                                            'Please enter your email ',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          const SizedBox(height: 16.0),
                                          Column(
                                            children: [
                                              TextFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Email address',
                                                ),
                                              ),
                                              colDivider,
                                            ],
                                          ),
                                          const SizedBox(height: 10.0),
                                          TextButton(
                                            onPressed: () {
                                              if (isNonModalBottomSheetOpen) {
                                                _nonModalBottomSheetController
                                                    ?.close();
                                                setState(() {
                                                  isNonModalBottomSheetOpen =
                                                      false;
                                                });
                                                return;
                                              } else {
                                                setState(() {
                                                  isNonModalBottomSheetOpen =
                                                      true;
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 14.0),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    ColorSeed.indigo.color,
                                                    ColorSeed.baseColor.color,
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Submit',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          rowDivider,
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text(
                                'Forgot password?',
                              )),
                        ),
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
                            'Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                    rowDivider,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                        ),
                        TextButton(
                            onPressed: () {
                              GoRouter.of(context).go("/signup");
                            },
                            child: const Text(
                              'SignUp',
                            ))
                      ],
                    ),
                    rowDivider,
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Or Login with'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20.0),
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
            ),
          );
        }));
  }

  void togglePasswordVisibility() {
    setState(() {
      _obscured = !_obscured;
    });
  }
}
