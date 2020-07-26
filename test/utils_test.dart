import 'package:busca_cep_app/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Deve retornar false se o está tentando verifica se é um número mas passou argumento vazio',
      () {
    final ehNumero = isNumeric(null);

    expect(ehNumero, false);
  });

  test(
      'Deve retornar false se o está tentando verifica se é um número mas passou argumento string vazio',
      () {
    final ehNumero = isNumeric("");

    expect(ehNumero, false);
  });

  test(
      'Deve retornar false se o está tentando verifica se é um número mas passou argumento string número com caractere especial',
      () {
    final ehNumero = isNumeric("123,9");

    expect(ehNumero, false);
  });

  test(
      'Deve retornar true se o está tentando verifica se é um número mas passou argumento string número',
      () {
    final ehNumero = isNumeric("1239");

    expect(ehNumero, true);
  });

  test(
      'Deve retornar true se o está tentando verifica se é um número mas passou argumento string número com casa decimal',
      () {
    final ehNumero = isNumeric("1239.9");

    expect(ehNumero, true);
  });

  test(
      'Deve retornar false se o está tentando verifica se é um número mas passou argumento string número com dois separadores decimais',
      () {
    final ehNumero = isNumeric("1239.9.9");

    expect(ehNumero, false);
  });

  test(
      'Deve retornar true se o está tentando verifica se é um número mas passou argumento string número negativo',
      () {
    final ehNumero = isNumeric("-1239");

    expect(ehNumero, true);
  });

  test(
      'Deve retornar true se o está tentando verifica se é um número mas passou argumento string número negativo com casas decimais',
      () {
    final ehNumero = isNumeric("-1239.98");

    expect(ehNumero, true);
  });

  test(
      'Deve retornar true se o está tentando verifica se é um número mas passou argumento string número em notacao científica',
      () {
    final ehNumero = isNumeric("1.859e-3");

    expect(ehNumero, true);
  });

  test(
      'Deve retornar false se o está tentando verifica se é um número mas passou argumento string número em notacao científica errada',
      () {
    final ehNumero = isNumeric("1.859e-3-");

    expect(ehNumero, false);
  });
}
