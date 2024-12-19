import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String generateSalt() {
    final random = Random.secure();
    final saltBytes = List<int>.generate(16, (index) => random.nextInt(256));
    return base64.encode(saltBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Create Account",
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
                "Create Account Here",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      validator: (val) =>
                          val!.isEmpty ? 'Invalid name field' : null,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (val) =>
                          val!.isEmpty ? 'Invalid Phone Number' : null,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: emailController,
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
                      controller: passwordController,
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Required atleast 6 characters'
                          : null,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: passwordConfirmController,
                      obscureText: true,
                      validator: (val) => val != passwordController.text
                          ? 'Confirm password doesnt match'
                          : null,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final salt = generateSalt();
                          final passwordWithSalt =
                              passwordController.text + salt;

                          final bytes = utf8.encode(passwordWithSalt);
                          final hashedPassword =
                              sha256.convert(bytes).toString();

                          // Simulate saving user data (can be replaced with a local storage/database implementation)
                          print("User registered:");
                          print("Email: ${emailController.text}");
                          print("Name: ${nameController.text}");
                          print("Phone: ${phoneController.text}");
                          print("Hashed Password: $hashedPassword");

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 12),
                      ),
                      child: const Text(
                        'Sign Up',
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
                              builder: (_) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Already have an account? Login",
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
}
