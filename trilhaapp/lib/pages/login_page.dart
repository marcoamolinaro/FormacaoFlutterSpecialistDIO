import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.amber,
              ),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                color: Colors.green,
                height: 30,
                child: const Text("Informe seu E-Mail"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
