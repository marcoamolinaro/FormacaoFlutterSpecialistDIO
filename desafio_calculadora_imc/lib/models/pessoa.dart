import 'dart:math';

class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;

  Pessoa(this._nome, this._peso, this._altura);

  void setNome(String nome) {
    _nome = nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  String getNome() {
    return _nome;
  }

  double getPeso() {
    return _peso;
  }

  double getAltura() {
    return _altura;
  }

  double calculaIMC() {
    return _peso / pow(_altura,2);
  }

  @override
  String toString() {
    return {"Nome: ": _nome, "Peso: ": _peso, "Altura: ": _altura}.toString();
  }
}
