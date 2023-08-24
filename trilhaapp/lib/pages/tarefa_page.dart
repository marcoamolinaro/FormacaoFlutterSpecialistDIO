import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/tarefa_repository.dart';

import '../model/tarefa.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = TarefaRepository();
  var descricaoController = TextEditingController();
  var _tarefas = const <Tarefa>[];
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    if (apenasNaoConcluidos) {
      _tarefas = await tarefaRepository.listarNaoConcluidas();
    } else {
      _tarefas = await tarefaRepository.listar();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              descricaoController.text = "";
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      title: const Text("Adicionar Tarefa"),
                      content: TextField(
                        controller: descricaoController,
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancelar")),
                        TextButton(
                            onPressed: () async {
                              await tarefaRepository.adicionar(
                                  Tarefa(descricaoController.text, false));
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: const Text("Salvar")),
                      ],
                    );
                  });
            }),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Apenas não concluídas",
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                        value: apenasNaoConcluidos,
                        onChanged: (bool value) {
                          apenasNaoConcluidos = value;
                          obterTarefas();
                        })
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _tarefas.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var tarefa = _tarefas[index];
                      return Dismissible(
                        onDismissed: (DismissDirection dd) async {
                          await tarefaRepository.revover(tarefa.id);
                          obterTarefas();
                        },
                        key: Key(tarefa.id),
                        child: ListTile(
                          title: Text(tarefa.descricao),
                          trailing: Switch(
                              value: tarefa.concluido,
                              onChanged: (bool value) async {
                                await tarefaRepository.alterar(
                                    tarefa.id, value);
                                obterTarefas();
                              }),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
