import 'package:flutter/material.dart';
import 'package:trilhaapp/model/dados_cadastrais.dart';
import 'package:trilhaapp/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/repositories/linguagem_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastraisHivePage extends StatefulWidget {
  const DadosCadastraisHivePage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisHivePage> createState() =>
      _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastrais = DadosCadastrais.vazio();
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var liguagemRepository = LinguagemRepository();
  var niveis = [];
  var linguagens = [];

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = liguagemRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastrais = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastrais.nome ?? "";
    dataNascimentoController.text = dadosCadastrais.dataNascimento == null
        ? ""
        : dadosCadastrais.dataNascimento.toString();

    setState(() {});
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
                        dadosCadastrais.dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(texto: "Nível de Experiência"),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            dense: true,
                            title: Text(nivel.toString()),
                            selected: dadosCadastrais.nivelExperiencia ==
                                nivel.toString(),
                            value: nivel.toString(),
                            groupValue: dadosCadastrais.nivelExperiencia,
                            onChanged: (value) {
                              setState(() {
                                dadosCadastrais.nivelExperiencia =
                                    value.toString();
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
                            value:
                                dadosCadastrais.linguagens.contains(linguagem),
                            onChanged: (value) {
                              if (value!) {
                                setState(() {
                                  dadosCadastrais.linguagens.add(linguagem);
                                });
                              } else {
                                setState(() {
                                  dadosCadastrais.linguagens.remove(linguagem);
                                });
                              }
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: "Tempo de Experiência"),
                  DropdownButton(
                      value: dadosCadastrais.tempoExperiencia,
                      isExpanded: true,
                      items: returnItems(50),
                      onChanged: (value) {
                        setState(() {
                          dadosCadastrais.tempoExperiencia =
                              int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          "Pretensão Salarial R\$ ${dadosCadastrais.salario?.round().toString()}"),
                  Slider(
                      min: 0,
                      max: 20000,
                      value: dadosCadastrais.salario ?? 0.0,
                      onChanged: (double value) {
                        setState(() {
                          dadosCadastrais.salario = value;
                        });
                      }),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        salvando = false;
                      });
                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O nome deve ser preenchido!")));
                        return;
                      }
                      if (dadosCadastrais.dataNascimento == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Data de Nascimento inválida")));
                        return;
                      }
                      if (dadosCadastrais.nivelExperiencia == null ||
                          dadosCadastrais.nivelExperiencia!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("O Nível deve ser selecionado!")));
                        return;
                      }
                      if (dadosCadastrais.linguagens.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Pelo menos uma Linguagem deve ser selecionada!")));
                        return;
                      }
                      if (dadosCadastrais.tempoExperiencia == 0 ||
                          dadosCadastrais.tempoExperiencia == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Deve ter ao menos 1 ano de experiência!")));
                        return;
                      }
                      if (dadosCadastrais.salario == 0 ||
                          dadosCadastrais.salario == null) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "A pretesão salarial deve ser maior que zeor!")));
                        return;
                      }

                      dadosCadastrais.nome = nomeController.text;

                      dadosCadastraisRepository.salvar(dadosCadastrais);

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
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shadowColor: Colors.green),
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
    );
  }
}
