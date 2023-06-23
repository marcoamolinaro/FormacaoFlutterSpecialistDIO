
import '../enum/tipo_notificacao.dart';

abstract class Pessoa {
  String _nome = "";
  String _endereco = "";
  String _email = "";
  String _celular = "";
  String _token = "";
  TipoNotificacao _tipoNotificacao = TipoNotificacao.NENHUM;

  Pessoa(
      String nome, String endereco, String email, String celular, String token,
      {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM}) {
    _nome = nome;
    _endereco = endereco;
    _email = email;
    _celular = celular;
    _token = token;
    _tipoNotificacao = tipoNotificacao;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  void setEndereco(String endereco) {
    _endereco = endereco;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setCelular(String celular) {
    _celular = celular;
  }

  void setToken(String token) {
    _token = token;
  }

  void setTipoNotificacao(TipoNotificacao tipoNotificacao) {
    _tipoNotificacao = tipoNotificacao;
  }

  String getNome() {
    return _nome;
  }

  String getEndereco() {
    return _endereco;
  }

  String getEmail() {
    return _email;
  }

  String getCelular() {
    return _celular;
  }

  String getToken() {
    return _token;
  }

  TipoNotificacao getTipoNotificacao() {
    return _tipoNotificacao;
  }

  @override
  String toString() {
    return {
      "Nome: ": _nome,
      "Endereço: ": _endereco,
      "TipoNotificacao: ": _tipoNotificacao,
      "E-mail: ": _email,
      "Celular: ": _celular,
      "Token: ": _token
    }.toString();
  }
}
