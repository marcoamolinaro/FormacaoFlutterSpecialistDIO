import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu App",
          style: GoogleFonts.qwigley(fontSize: 40),
        ),
      ),
      body: Center(
          child: Text(numeroGerado.toString(),
              style: GoogleFonts.acme(fontSize: 20))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box),
        onPressed: () {
          setState(() {
            numeroGerado =
                GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
          });
        },
      ),
    );
  }
}
