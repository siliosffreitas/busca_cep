import 'package:busca_cep_app/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Deve formatar uma data passada de forma correta',
          () {
        final date = DateTime(2020, 05, 25, 17, 46, 54);
        final formatedDate = formatDate_ddMMyyyyHHmm_Human(date.millisecondsSinceEpoch);

        expect(formatedDate, "25/05/2020 às 17:46");
      });

  test(
      'Deve formatar uma data de hoje',
          () {
        final now =  DateTime.now();
        final date = DateTime(now.year, now.month, now.day, 17, 46, 54);
        final formatedDate = formatDate_ddMMyyyyHHmm_Human(date.millisecondsSinceEpoch);

        expect(formatedDate, "Hoje às 17:46");
      });

  test(
      'Deve formatar uma data de amanhã',
          () {
        final now =  DateTime.now();
        final tomorrow = now.add(Duration(days: 1));

        final date = DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 17, 46, 54);
        final formatedDate = formatDate_ddMMyyyyHHmm_Human(date.millisecondsSinceEpoch);

        expect(formatedDate, "Amanhã às 17:46");
      });

  test(
      'Deve formatar uma data de ontem',
          () {
        final now =  DateTime.now();
        final yesterday = now.subtract(Duration(days: 1));

        final date = DateTime(yesterday.year, yesterday.month, yesterday.day, 17, 46, 54);
        final formatedDate = formatDate_ddMMyyyyHHmm_Human(date.millisecondsSinceEpoch);

        expect(formatedDate, "Ontem às 17:46");
      });
}