class Configuracoes {
  String _nomeUsuario = "";
  double _altura = 0.0;
  bool _receberNotificacoes = false;
  bool _temaEscuro = false;

  Configuracoes.vazio() {
    _nomeUsuario = "";
    _altura = 0.0;
    _receberNotificacoes = false;
    _temaEscuro = false;
  }

  Configuracoes(this._nomeUsuario, this._altura, this._receberNotificacoes,
      this._temaEscuro);

  String get nomeUsuario => _nomeUsuario;
  double get altura => _altura;
  bool get receberNotificacoes => _receberNotificacoes;
  bool get temaEscuro => _temaEscuro;

  set nomeUsuario(String nomeUsuario) {
    _nomeUsuario = nomeUsuario;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set receberNotificacoes(bool receberNotificacoes) {
    _receberNotificacoes = receberNotificacoes;
  }

  set temaEscuro(bool temaEscuro) {
    _temaEscuro = temaEscuro;
  }
}
