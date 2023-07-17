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
        backgroundColor: Colors.grey,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.person,
                size: 125,
                color: Colors.blueAccent,
              ),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 30,
                alignment: Alignment.center,
                child: const Row(children: [
                  Expanded(flex: 2, child: Text("Informe seu e-mail:")),
                  Expanded(flex: 3, child: Text("Email")),
                ]),
              ),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 30,
                alignment: Alignment.center,
                child: const Row(children: [
                  Expanded(flex: 2, child: Text("Informe seu senha:")),
                  Expanded(flex: 3, child: Text("Senha")),
                ]),
              ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                color: Colors.green,
                height: 30,
                alignment: Alignment.center,
                child: const Text("Login"),
              ),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                color: Colors.green,
                height: 30,
                alignment: Alignment.center,
                child: const Text("Cadastro"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
