import 'dart:io';
import 'package:desafio_calculadora_imc/models/pessoa.dart';
import 'exception/nome_invalido_exception.dart';
import 'exception/valor_invalido_exception.dart';
import 'models/console_utils.dart';

void execute() {
  print("Calculadora IMC!");
  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do aluno:");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException().toString();
    }
  } on NomeInvalidoException {
    nome = "";
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  double peso = 0.0;
  try {
    peso = ConsoleUtils.lerDoubleComTexto("Digite o peso")!;
    if ((peso == 0.0) || (peso.isNaN)) {
      print("Não informou o valor...");
      throw ValorInvalidoException();
    }
  } on ValorInvalidoException {
    peso = 0.0;
    print("Peso deve ser > 0");
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  double altura = 0.0;
  try {
    altura = ConsoleUtils.lerDoubleComTexto("Digite a altura")!;
    if (altura == 0.0) {
      throw ValorInvalidoException();
    }
  } on ValorInvalidoException {
    altura = 0.0;
    print("Altura deve ser > 0");
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  var pessoa = Pessoa(nome, peso, altura);

  double imc = pessoa.calculaIMC();

  String classificacao = "";

  if (imc < 16) {
    classificacao = "Magreza grave";
  } else if (imc < 17) {
    classificacao = "Magreza moderada";
  } else if (imc < 18.5) {
    classificacao = "Magreza leve";
  } else if (imc < 25) {
    classificacao = "Saudável";
  } else if (imc < 30) {
    classificacao = "Sobrepeso";
  } else if (imc < 35) {
    classificacao = "Obesidade Grau I";
  } else if (imc < 40) {
    classificacao = "Obesidade Grau II (severa)";
  } else if (imc >= 40) {
    classificacao = "Obesidade Grau III (mórbida)";
  }

  var imcStr = imc.toStringAsFixed(2);

  print("IMC de ${pessoa.getNome()} é $imcStr e a classificação $classificacao");

  print(pessoa);
}
