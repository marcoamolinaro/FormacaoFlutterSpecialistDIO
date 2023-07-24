import 'package:flutter/material.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  TextEditingController nomeController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus Dados")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nome",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            TextField(
              controller: nomeController,
            ),
            TextButton(
                onPressed: () {
                  print(nomeController.text);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
