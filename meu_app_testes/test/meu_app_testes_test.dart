import 'package:meu_app_testes/classes/via_cep.dart';
import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'meu_app_testes_test.mocks.dart';

@GenerateMocks([MockViaCep])
void main() {
  test('Calcula o valor do produto com desconto sem percentagem', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test('Calcula o valor do prod com desconto sem % com valor prod zero', () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o valor do produto com desconto com percentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  test('Calcula o valor do produto com desconto zeradp com percentagem', () {
    expect(() => app.calcularDesconto(1000, 0, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Testar conversão para uppercase', () {
    expect(app.convertToUpper("marco"), equals("MARCO"));
  });

  test('Testar conversão para uppercase teste 2', () {
    expect(app.convertToUpper("marco"), equalsIgnoringCase("marco"));
  });

  test('Valor maior que 50', () {
    expect(app.retornaValor(50), greaterThanOrEqualTo(50));
  });

  test('Começa com', () {
    expect(app.convertToUpper("marco"), startsWith("MA"));
  });

  test('Valor diferente', () {
    expect(app.retornaValor(50), isNot(equals(56)));
  });

  test('Retornar CEP', () async {
    MockMockViaCep mockMockViaCep = MockMockViaCep();

    when(mockMockViaCep.retornarCEP("01001000"))
      .thenAnswer((realInvocation) => Future.value(
        {
          "cep": "01001-000",
          "logradouro": "Praça da Sé",
          "complemento": "lado ímpar",
          "bairro": "Sé",
          "localidade": "São Paulo",
          "uf": "SP",
          "ibge": "3550308",
          "gia": "1004",
          "ddd": "11",
          "siafi": "7107"
        }
      ));

    var body = await mockMockViaCep.retornarCEP("01001000");

    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

class MockViaCep extends Mock implements ViaCep {}
