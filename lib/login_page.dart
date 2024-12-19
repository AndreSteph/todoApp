import 'package:flutter/material.dart';

import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Image(
                  alignment: Alignment.center,
                  image: AssetImage('assets/images/logo.png'),
                  height: 100,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "SignIn Here",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) =>
                          val!.isEmpty ? 'Invalid email address' : null,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordTextController,
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Required atleast 6 characters'
                          : null,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final email = _emailTextController.text;
                          final emailRegex =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                          if (emailRegex.hasMatch(email)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          } else {
                            // ignore: avoid_print
                            print("Invalid email format");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 12),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "New User? Create Account",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}// TODO Implement this library.