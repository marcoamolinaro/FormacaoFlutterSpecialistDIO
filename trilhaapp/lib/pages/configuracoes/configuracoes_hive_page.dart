import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/configuracoes_repository.dart';

import '../../model/configuracoes.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesReposiroty configuracoesReposiroty;
  var configuracoes = Configuracoes.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesReposiroty = await ConfiguracoesReposiroty.carregar();
    configuracoes = configuracoesReposiroty.obterDados();

    nomeUsuarioController.text = configuracoes.nomeUsuario;
    alturaController.text = configuracoes.altura.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Configurações Hive"),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(hintText: "Nome Usuário"),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Altura"),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
                title: const Text("Receber Notificações"),
                value: configuracoes.receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    configuracoes.receberNotificacoes = value;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: configuracoes.temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    configuracoes.temaEscuro = value;
                  });
                }),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlue, shadowColor: Colors.green),
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                try {
                  configuracoes.altura = double.parse(alturaController.text);
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text("Meu App"),
                          content: const Text("Favor informar altura válida"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"))
                          ],
                        );
                      });
                  return;
                }
                configuracoes.nomeUsuario = nomeUsuarioController.text;
                configuracoesReposiroty.salvar(configuracoes);
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              child: const Text(
                "Salvar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
