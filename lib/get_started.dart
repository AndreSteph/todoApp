import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Todo App",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Todo",
                style: TextStyle(color: Colors.blue, fontSize: 28),
              ),
            ),
            const SizedBox(height: 30),
            SvgPicture.asset(
              'assets/images/hero.svg',
              height: 150,
              width: 250,
            ),
            const SizedBox(height: 60),
            const Center(
              child: Text(
                "Welcome to Todo App",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Todo will help you to stay organized\n and perform your tasks much faster",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 16), // Button size
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center both icon and text horizontally
                  children: [
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white, // White icon color
                    ),
                    SizedBox(
                        width: 8.0), // Adjust the spacing between icon and text
                    Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white, // White text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
