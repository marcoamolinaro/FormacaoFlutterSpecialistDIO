import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  group("Calcula o valor do produto com desconto: ", () {
      var valuesToTest = {
        {"valor": 1000, "desconto": 150, "percentural": false}: 850,
        {"valor": 1000, "desconto": 15, "percentural": true}: 985,
      };
      valuesToTest.forEach((values, expected) {
        test("Entrada $values Esperado: $expected", () {
          expect(
              app.calcularDesconto(
                  double.parse(values["valor"].toString()),
                  double.parse(values["desconto"].toString()),
                  values["percentual"] == true),
              equals(expected));
        });
      });
    });

  group("Calcula o valor do produto informando valores zerados: ", () {
    var valuesToTest = {
      {"valor": 0, "desconto": 150, "percentural": false},
      {"valor": 1000, "desconto": 0, "percentural": true},
    };
    for (var values in valuesToTest) {
      test("Entrada $values Esperado:", () {
        expect(
            () => app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });
}
