import 'package:meu_app_oo/classes/pessoa_abstract.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';

class PessoaJuridica extends Pessoa {
  String _cnpj = "";

  PessoaJuridica(String nome, String endereco, String cnpj, 
    String email, String celular, String token,
    {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, email, celular, token, tipoNotificacao: tipoNotificacao) {
    _cnpj = cnpj;
  }

  void setCnpj(String cnpj) {
    _cnpj = cnpj;
  }

  String getCnpj() {
    return _cnpj = "";
  }

  @override
  String toString() {
    return {
      "Empresa: ": getNome(), 
      "Endereço: ": getEndereco(),
      "CNPJ: ": _cnpj,
      "E-Mail: ": getEmail(),
      "Celular: ": getCelular(),
      "Token: ": getToken(),
      "TipoNotificacao: ": getTipoNotificacao()}.toString();
  }
}
