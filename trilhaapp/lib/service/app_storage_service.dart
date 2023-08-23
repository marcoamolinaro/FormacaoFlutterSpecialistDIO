import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
  CHAVE_DADOS_CADASTRAIS_SALARIO,
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA
}

class AppStorageClass {
  void _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  void _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  void _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  void _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0.0;
  }

  void _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }

  void setDadosCadastraisNome(String value) {
    _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), value);
  }

  Future<String> getDadosCadastraisNome() {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }

  void setDadosCadastraisDataNascimento(String value) {
    _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(),
        value);
  }

  Future<String> getDadosCadastraisDataNascimento() {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }

  void setDadosCadastraisNivelExperiencia(String value) {
    _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(),
        value);
  }

  Future<String> getDadosCadastraisNivelExperiencia() {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString());
  }

  void setDadosCadastraisLinguagens(List<String> values) {
    _setStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString(), values);
  }

  Future<List<String>> getDadosCadastraisLinguagens() {
    return _getStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString());
  }

  void setDadosCadastraisTempoExperiencia(int value) {
    _setInt(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(),
        value);
  }

  Future<int> getDadosCadastraisTempoExperiencia() {
    return _getInt(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

  void setDadosCadastraisSalario(double value) {
    _setDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), value);
  }

  Future<double> getDadosCadastraisSalario() {
    return _getDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }
}
