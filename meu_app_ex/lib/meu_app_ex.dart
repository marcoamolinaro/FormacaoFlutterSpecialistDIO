import 'dart:io';

import 'exception/nome_invalido_exception.dart';
import 'models/aluno.dart';
import 'models/console_utils.dart';

void execute() {
  print("Bem vindo ao Sistemas de Notas");
  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do aluno");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    nome = "Nome padrão";
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  var aluno = Aluno(nome);
  double? nota;
  do {
    nota = ConsoleUtils.lerDoubleComTextoComSaida(
        "Digite a nota ou S para Sair", "S");
    if (nota != null) {
      aluno.adicionarNotas(nota);
    }
  } while (nota != null);
  print("As notas digitadas foram ${aluno.getNotas()}");
  print("A média do aluno ${aluno.getNome()} foi ${aluno.retornaMedia()}");
  if (aluno.aprovado(7)) {
    print("O aluno ${aluno.getNome()} foi aprovado");
  } else {
    print("O aluno ${aluno.getNome()} foi reprovado");
  }
}
