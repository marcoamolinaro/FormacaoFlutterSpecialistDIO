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
  int tempoDeExperiencia = 0;
  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = liguagemRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItems(int qtdeMaxima) {
    var items = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= qtdeMaxima; i++) {
      items.add(DropdownMenuItem(value: i, child: Text(i.toString())));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus Dados")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
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
                  const TextLabel(texto: "Tempo de Experiência"),
                  DropdownButton(
                      value: tempoDeExperiencia,
                      isExpanded: true,
                      items: returnItems(50),
                      onChanged: (value) {
                        setState(() {
                          tempoDeExperiencia = int.parse(value.toString());
                        });
                      }),
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
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nome deve ser preenchido!")));
                          return;
                        }
                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Data de Nascimento inválida")));
                          return;
                        }
                        if (nivelSelecionado.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O Nível deve ser selecionado!")));
                          return;
                        }
                        if (linguagensSelecionadas.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Pelo menos uma Linguagem deve ser selecionada!")));
                          return;
                        }
                        if (tempoDeExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Deve ter ao menos 1 ano de experiência!")));
                          return;
                        }
                        if (salarioEscolhido == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretesão salarial deve ser maior que zeor!")));
                          return;
                        }
                        setState(() {
                          salvando = true;
                        });

                        Future.delayed(const Duration(seconds: 3), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Dados salvos com sucesso!")));
                          setState(() {
                            salvando = false;
                          });
                          Navigator.pop(context);
                        });
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}
