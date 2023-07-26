import 'package:flutter/material.dart';

import '../../pages/dados_cadastrais_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
              ),
              accountName: const Text("Marco Aurelio"),
              accountEmail: const Text("marco@gmail.com")),
          InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DadosCadastraisPage()));
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Dados Cadastrais"),
                    ],
                  ))),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Configurações"),
                    ],
                  ))),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.privacy_tip),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Termos de Uso e Privacidade"),
                    ],
                  ))),
        ],
      ),
    );
  }
}
