import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilhaapp/model/tarefa_hive_model.dart';

import 'model/dados_cadastrais.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory = await path_provider.getApplicationCacheDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());

  runApp(const MyApp());
}
