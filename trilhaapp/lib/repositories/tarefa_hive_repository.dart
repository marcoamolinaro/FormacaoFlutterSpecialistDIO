import 'package:hive/hive.dart';
import 'package:trilhaapp/model/tarefa_hive_model.dart';

class TarefaHiveRepository {
  static late Box _box;
  static const String CHAVE_TAREFA = "CHAVE_TAREFA";

  TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    if (Hive.isBoxOpen(CHAVE_TAREFA)) {
      _box = Hive.box(CHAVE_TAREFA);
    } else {
      _box = await Hive.openBox(CHAVE_TAREFA);
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHiveModel tarefaHiveModel) {
    _box.add(tarefaHiveModel);
  }

  alterar(TarefaHiveModel tarefaHiveModel) {
    tarefaHiveModel.save();
  }

  excluir(TarefaHiveModel tarefaHiveModel) {
    tarefaHiveModel.delete();
  }

  List<TarefaHiveModel> obterDados(bool naoCloncluido) {
    if (naoCloncluido) {
      return _box.values
          .cast<TarefaHiveModel>()
          .where((element) => !element.concluido)
          .toList();
    }
    return _box.values.cast<TarefaHiveModel>().toList();
  }
}
