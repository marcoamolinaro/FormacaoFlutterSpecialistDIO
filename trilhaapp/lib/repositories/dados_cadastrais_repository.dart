import 'package:hive/hive.dart';
import 'package:trilhaapp/model/dados_cadastrais.dart';

class DadosCadastraisRepository {
  static late Box _box;
  static final String CHAVE_DADOS_CADASTRAIS = "CHAVE_DADOS_CADASTRAIS";

  DadosCadastraisRepository._criar();

  static Future<DadosCadastraisRepository> carregar() async {
    if (Hive.isBoxOpen(CHAVE_DADOS_CADASTRAIS)) {
      _box = Hive.box(CHAVE_DADOS_CADASTRAIS);
    } else {
      _box = await Hive.openBox(CHAVE_DADOS_CADASTRAIS);
    }
    return DadosCadastraisRepository._criar();
  }

  void salvar(DadosCadastrais dadosCadastrais) {
    _box.put(CHAVE_DADOS_CADASTRAIS, dadosCadastrais);
  }

  DadosCadastrais obterDados() {
    var dadosCadastrias = _box.get(CHAVE_DADOS_CADASTRAIS);
    if (dadosCadastrias == null) {
      return DadosCadastrais.vazio();
    }
    return dadosCadastrias;
  }
}
