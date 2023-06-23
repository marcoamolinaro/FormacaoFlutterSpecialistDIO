import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';

class PessoaFisica extends Pessoa {
  String _cpf = "";

  PessoaFisica(String nome, String endereco, String cpf, 
    String email, String token, String celular,
    {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, email, celular, token, tipoNotificacao: tipoNotificacao) {
    _cpf = cpf;
  }

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  String getCpf() {
    return _cpf;
  }

  @override
  String toString() {
    return {
      "Nome: ": getNome(), 
      "Endereço: ": getEndereco(),
      "CPF: ": _cpf,
      "E-Mail: ": getEmail(),
      "Celular: ": getCelular(),
      "Token: ": getToken(),
      "TipoNotificacao: ": getTipoNotificacao()}.toString();
  }
}
