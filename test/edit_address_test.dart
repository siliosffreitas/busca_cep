import 'package:busca_cep_app/views/edit_address/edit_address_screen.dart';
import 'package:busca_cep_app/views/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'mocks.dart';

main() {
  group('Teste do novo endereço', () {
    MockApi mockApi;
    setUp(() {
      mockApi = MockApi();

      GetIt.instance.reset();
      GetIt.instance.registerSingleton<HomeStore>(HomeStore());
    });

    testWidgets(
        'quando abre a tela de adicao deve verificar a existencia dos campos',
        (tester) async {
      await tester.pumpWidget(MaterialApp(home: EditAddressScreen()));

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is Text) {
            return widget.data == "Novo Endereço";
          }
          return false;
        }),
        findsOneWidget,
      );

      expect(
        find.bySemanticsLabel("CEP"),
        findsOneWidget,
      );

      expect(
        find.byIcon(Icons.done),
        findsOneWidget,
      );
    });

    testWidgets(
        'quando clica para adicionar um cep e nao tem nenhum cep digitado',
        (tester) async {
      await tester.pumpWidget(MaterialApp(home: EditAddressScreen()));

      expect(
        find.bySemanticsLabel("Insira o CEP"),
        findsNothing,
      );

      await tester.tap(find.byIcon(Icons.done));
      await tester.pumpAndSettle();

      expect(
        find.bySemanticsLabel("Insira o CEP"),
        findsOneWidget,
      );
    });

    testWidgets('Mostra mensagem de erro quando digita um cep incompleto',
        (tester) async {
      await tester.pumpWidget(MaterialApp(home: EditAddressScreen()));

      expect(
        find.bySemanticsLabel("CEP inválido"),
        findsNothing,
      );

      await tester.enterText(
        find.bySemanticsLabel("CEP"),
        '000000',
      );

      await tester.tap(find.byIcon(Icons.done));
      await tester.pumpAndSettle();

      expect(
        find.bySemanticsLabel("CEP inválido"),
        findsOneWidget,
      );
    });
  });
}
