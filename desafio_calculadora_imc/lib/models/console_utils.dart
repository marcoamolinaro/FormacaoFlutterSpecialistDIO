import 'dart:convert';
import 'dart:io';

import '../exception/valor_invalido_exception.dart';

class ConsoleUtils {
  static String lerStringComTexto(String texto) {
    print(texto);
    return lerString();
  }

  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? lerDouble() {
    var value = lerString();
    try {
      return double.parse(value);
    } catch (e) {
      throw ValorInvalidoException();
    }
  }

  static double? lerDoubleComTextoComSaida(String texto, String valorSaida) {
    do {
      try {
        var value = lerStringComTexto(texto);
        if (value == valorSaida) {
          throw ValorInvalidoException();
        }
        return double.parse(value);
      } catch (e) {
        print(texto);
      }
    } while (true);
  }

  static double? lerDoubleComTexto(String texto) {
    print(texto);
    return lerDouble();
  }
}
