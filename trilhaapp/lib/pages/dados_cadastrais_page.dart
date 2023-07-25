import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagem_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var liguagemRepository = LinguagemRepository();
  var niveis = [];
  var linguagens = [];
  var nivelSelecionado = "";
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = liguagemRepository.retornaLinguagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus Dados")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            const TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            const TextLabel(texto: "Data de Nascimento"),
            TextField(
              controller: dataNascimentoController,
              readOnly: true,
              onTap: () async {
                var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 5, 20),
                    lastDate: DateTime(2023, 10, 23));
                if (data != null) {
                  dataNascimentoController.text = data.toString();
                  dataNascimento = data;
                }
              },
            ),
            const TextLabel(texto: "Nível de Experiência"),
            Column(
              children: niveis
                  .map((nivel) => RadioListTile(
                      dense: true,
                      title: Text(nivel.toString()),
                      selected: nivelSelecionado == nivel.toString(),
                      value: nivel.toString(),
                      groupValue: nivelSelecionado,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          nivelSelecionado = value.toString();
                        });
                      }))
                  .toList(),
            ),
            const TextLabel(texto: "Linguagens Preferidas"),
            Column(
              children: linguagens
                  .map((linguagem) => CheckboxListTile(
                      dense: true,
                      title: Text(linguagem.toString()),
                      value: linguagensSelecionadas.contains(linguagem),
                      onChanged: (value) {
                        if (value!) {
                          setState(() {
                            linguagensSelecionadas.add(linguagem);
                          });
                        } else {
                          setState(() {
                            linguagensSelecionadas.remove(linguagem);
                          });
                        }
                      }))
                  .toList(),
            ),
            TextLabel(
                texto:
                    "Pretensão Salarial R\$ ${salarioEscolhido.round().toString()}"),
            Slider(
                min: 0,
                max: 20000,
                value: salarioEscolhido,
                onChanged: (double value) {
                  setState(() {
                    salarioEscolhido = value;
                  });
                  print(value);
                }),
            TextButton(
                onPressed: () {
                  print(nomeController.text);
                  print(dataNascimento);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
