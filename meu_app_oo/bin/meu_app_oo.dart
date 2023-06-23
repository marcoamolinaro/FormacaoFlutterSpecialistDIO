import 'package:meu_app_oo/classes/pessoa_fisica.dart';
import 'package:meu_app_oo/classes/pessoa_juridica.dart';
import 'package:meu_app_oo/enum/tipo_notificacao.dart';
import 'package:meu_app_oo/service/enviar_notificacao.dart';

void main(List<String> arguments) {
  var pf1 = PessoaFisica("Pessoa Fisica 1", "Endereco PF1", "111111111",
      "email 1", "celular 1", "token 1");
  var pj1 = PessoaJuridica("Empresa 1", "Endereco PJ1", "222222222", "email 2",
      "celular 2", "token 2",
      tipoNotificacao: TipoNotificacao.SMS);

  print(pf1);
  print(pj1);

  EnviarNotiticacao enviarNotiticacao = EnviarNotiticacao();
  enviarNotiticacao.notificar(pf1);
  enviarNotiticacao.notificar(pj1);
}
