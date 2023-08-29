import 'package:hive/hive.dart';

import '../model/configuracoes.dart';

class ConfiguracoesReposiroty {
  static late Box _box;

  ConfiguracoesReposiroty._criar();

  static Future<ConfiguracoesReposiroty> carregar() async {
    if (Hive.isBoxOpen('configuracoes')) {
      _box = Hive.box('configuracoes');
    } else {
      _box = await Hive.openBox('configuracoes');
    }
    return ConfiguracoesReposiroty._criar();
  }

  void salvar(Configuracoes configuracoes) {
    _box.put('configuracoes', {
      'nomeUsuario': configuracoes.nomeUsuario,
      'altura': configuracoes.altura,
      'receberNotificacoes': configuracoes.receberNotificacoes,
      'temaEscuro': configuracoes.temaEscuro
    });
  }

  Configuracoes obterDados() {
    var configuracoes = _box.get('configuracoes');
    if (configuracoes == null) {
      return Configuracoes.vazio();
    }
    return Configuracoes(configuracoes["nomeUsuario"], configuracoes["altura"],
        configuracoes["receberNotificacoes"], configuracoes["temaEscuro"]);
  }
}
