import 'package:busca_cep_app/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Deve retornar Domingo quando passa 0',
          () {
        final diaSemana = formateWeekDay(0);

        expect(diaSemana, "Domingo");
      });
  test(
      'Deve retornar Segunda-Feira quando passa 1',
          () {
        final diaSemana = formateWeekDay(1);

        expect(diaSemana, "Segunda-Feira");
      });

  test(
      'Deve retornar Terça-Feira quando passa 2',
          () {
        final diaSemana = formateWeekDay(2);

        expect(diaSemana, "Terça-Feira");
      });

  test(
      'Deve retornar Quarta-Feira quando passa 3',
          () {
        final diaSemana = formateWeekDay(3);

        expect(diaSemana, "Quarta-Feira");
      });

  test(
      'Deve retornar Quinta-Feira quando passa 4',
          () {
        final diaSemana = formateWeekDay(4);

        expect(diaSemana, "Quinta-Feira");
      });

  test(
      'Deve retornar Sexta-Feira quando passa 5',
          () {
        final diaSemana = formateWeekDay(5);

        expect(diaSemana, "Sexta-Feira");
      });

  test(
      'Deve retornar Sábado quando passa 6',
          () {
        final diaSemana = formateWeekDay(6);

        expect(diaSemana, "Sábado");
      });

  test(
      'Deve retornar Domingo quando passa 7',
          () {
        final diaSemana = formateWeekDay(7);

        expect(diaSemana, "Domingo");
      });

  test(
      'Deve retornar Sábado quando passa -1',
          () {
        final diaSemana = formateWeekDay(-1);

        expect(diaSemana, "Sábado");
      });
}