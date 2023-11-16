import 'package:trilhaapp/model/tarefa_sqlite_model.dart';
import 'package:trilhaapp/repositories/sqlite/sqlite_database.dart';

class TarefaSqliteRepository {
  Future<List<TarefaSqliteModel>> obterDados(bool apenalNaoConcluidos) async {
    List<TarefaSqliteModel> tarefas = [];
    var db = await SqliteDataBase().obterDatabase();
    var result = await db.rawQuery(apenalNaoConcluidos
        ? 'SELECT id, descricao, concluido FROM tarefas WHERE concluido = 0'
        : 'SELECT id, descricao, concluido FROM tarefas');
    for (var element in result) {
      tarefas.add(TarefaSqliteModel(int.parse(element["id"].toString()),
          element["descricao"].toString(), element["concluido"] == 1));
    }

    return tarefas;
  }

  Future<void> salvar(TarefaSqliteModel tarefaSqliteModel) async {
    var db = await SqliteDataBase().obterDatabase();
    await db.rawInsert('INSERT INTO tarefas(descricao, concluido) VALUES (?,?)',
        [tarefaSqliteModel.descricao, tarefaSqliteModel.concluido]);
  }

  Future<void> atualizar(TarefaSqliteModel tarefaSqliteModel) async {
    var db = await SqliteDataBase().obterDatabase();
    await db.rawUpdate(
        'UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?', [
      tarefaSqliteModel.descricao,
      tarefaSqliteModel.concluido,
      tarefaSqliteModel.id
    ]);
  }

  Future<void> remover(int id) async {
    var db = await SqliteDataBase().obterDatabase();
    await db.rawDelete('DELETE FROM tarefas WHERE id = ?', [id]);
  }
}
