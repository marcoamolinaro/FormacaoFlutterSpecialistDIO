import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences storage;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA";
  final CHAVE_RECEBER_NOTIFICACOES = "CHAVE_RECEBER_NOTIFICACOES";
  final CHAVE_TEMA_ESCURO = "CHAVE_TEMA_ESCURO";

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
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      temaEscuro = storage.getBool(CHAVE_TEMA_ESCURO) ?? false;
      receberNotificacoes =
          storage.getBool(CHAVE_RECEBER_NOTIFICACOES) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
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
                  await storage.setDouble(CHAVE_ALTURA, altura);
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
                await storage.setString(
                    CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                await storage.setBool(
                    CHAVE_RECEBER_NOTIFICACOES, receberNotificacoes);
                await storage.setBool(CHAVE_TEMA_ESCURO, temaEscuro);
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
