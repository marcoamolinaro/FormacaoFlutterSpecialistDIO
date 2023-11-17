import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  var cepController = TextEditingController(text: "");
  String endereco = "";
  String cidade = "";
  String estado = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text(
              "Consulta de CEP",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                var cep = value.replaceAll(RegExp(r'[^0-9]'), "");
                print(cep);
                if (cep.isNotEmpty && cep.trim().length == 8) {
                  cidade = "Cidade 1";
                  estado = "Estado 1";
                  endereco = "Rua 1";
                } else {
                  cidade = "";
                  estado = "";
                  endereco = "";
                }
                setState(() {});
              },
            ),
            const SizedBox(height: 50),
            Text(
              endereco,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "$cidade - $estado",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var response = await http.get(Uri.parse("https://www.google.com"));
          print(response.body);
        },
      ),
    ));
  }
}
