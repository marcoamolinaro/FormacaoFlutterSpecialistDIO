import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosHivePageState();
}

class _NumerosAleatoriosHivePageState extends State<NumerosAleatoriosHivePage> {
  late Box boxNumeroAleatorios;

  int? numeroGerado = 0;
  int? quantidadeCliques = 0;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen('box_numero_aleatorios')) {
      boxNumeroAleatorios = Hive.box('box_numero_aleatorios');
    } else {
      boxNumeroAleatorios = await Hive.openBox('box_numero_aleatorios');
    }
    numeroGerado = boxNumeroAleatorios.get('numeroGerado') ?? 0;
    quantidadeCliques = boxNumeroAleatorios.get('quantidadeCliques') ?? 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Números Aleatórios - Hive"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null
                    ? "Nenhum número gerado"
                    : numeroGerado.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                quantidadeCliques == null
                    ? "Nenhum clique efetuado"
                    : quantidadeCliques.toString(),
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1;
            });
            boxNumeroAleatorios.put('numeroGerado', numeroGerado!);
            boxNumeroAleatorios.put('quantidadeCliques', quantidadeCliques!);
          },
        ),
      ),
    );
  }
}
