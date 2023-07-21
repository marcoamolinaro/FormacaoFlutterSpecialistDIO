import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: const Text("Dados Cadastrais"))),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: const Text("Configurações"))),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        child: const Text("Termos de Uso e Privacidade"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
