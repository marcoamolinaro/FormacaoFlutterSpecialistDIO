import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tarefa_sqlite_model.dart';
import 'package:trilhaapp/repositories/sqlite/tarefa_sqlite_repository.dart';
import 'package:trilhaapp/repositories/tarefa_hive_repository.dart';

import '../../model/tarefa_hive_model.dart';

class TarefaSqlitePage extends StatefulWidget {
  const TarefaSqlitePage({super.key});

  @override
  State<TarefaSqlitePage> createState() => _TarefaSqlitePageState();
}

class _TarefaSqlitePageState extends State<TarefaSqlitePage> {
  TarefaSqliteRepository tarefaRepository = TarefaSqliteRepository();
  var descricaoController = TextEditingController();
  var _tarefas = const <TarefaSqliteModel>[];
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepository.obterDados(apenasNaoConcluidos);
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
                              await tarefaRepository.salvar(TarefaSqliteModel(
                                  0, descricaoController.text, false));
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              obterTarefas();
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
                          tarefaRepository.remover(tarefa.id);
                          obterTarefas();
                        },
                        key: Key(tarefa.descricao),
                        child: ListTile(
                          title: Text(tarefa.descricao),
                          trailing: Switch(
                              value: tarefa.concluido,
                              onChanged: (bool value) async {
                                tarefa.concluido = value;
                                tarefaRepository.atualizar(tarefa);
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
