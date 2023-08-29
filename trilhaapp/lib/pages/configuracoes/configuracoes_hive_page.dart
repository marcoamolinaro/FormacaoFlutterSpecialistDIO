import 'package:flutter/material.dart';
import 'package:trilhaapp/service/app_storage_service.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  AppStorageClass storage = AppStorageClass();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text = (await storage.getConfiguracoesAltura()).toString();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    receberNotificacoes = await storage.getConfiguracoesReceberNotificacoes();
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
                value: receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = value;
                  });
                }),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = value;
                  });
                }),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlue, shadowColor: Colors.green),
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                try {
                  var altura = double.parse(alturaController.text);
                  await storage.setConfiguracoesAltura(altura);
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
                await storage
                    .setConfiguracoesNomeUsuario(nomeUsuarioController.text);
                await storage
                    .setConfiguracoesReceberNotificacoes(receberNotificacoes);
                await storage.setConfiguracoesTemaEscuro(temaEscuro);
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
