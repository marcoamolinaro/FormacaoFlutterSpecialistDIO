import 'package:hive/hive.dart';

import '../model/configuracoes.dart';

class ConfiguracoesReposiroty {
  static late Box _box;
  static final String CHAVE_CONFIGURACOES = "CHAVE_CONFIGURACOES";
  static final String FIELD_NOME_USUARIO = "nomeUsuario";
  static final String FIELD_ALTURA = "altura";
  static final String FIELD_RECEBER_NOTIFICACOES = "receberNotificacoes";
  static final String TEMA_ESCURO = "temaEscuro";
  ConfiguracoesReposiroty._criar();

  static Future<ConfiguracoesReposiroty> carregar() async {
    if (Hive.isBoxOpen(CHAVE_CONFIGURACOES)) {
      _box = Hive.box(CHAVE_CONFIGURACOES);
    } else {
      _box = await Hive.openBox(CHAVE_CONFIGURACOES);
    }
    return ConfiguracoesReposiroty._criar();
  }

  void salvar(Configuracoes configuracoes) {
    _box.put(CHAVE_CONFIGURACOES, {
      FIELD_NOME_USUARIO: configuracoes.nomeUsuario,
      FIELD_ALTURA: configuracoes.altura,
      FIELD_RECEBER_NOTIFICACOES: configuracoes.receberNotificacoes,
      TEMA_ESCURO: configuracoes.temaEscuro
    });
  }

  Configuracoes obterDados() {
    var configuracoes = _box.get(CHAVE_CONFIGURACOES);
    if (configuracoes == null) {
      return Configuracoes.vazio();
    }
    return Configuracoes(
        configuracoes[FIELD_NOME_USUARIO],
        configuracoes[FIELD_ALTURA],
        configuracoes[FIELD_RECEBER_NOTIFICACOES],
        configuracoes[TEMA_ESCURO]);
  }
}
