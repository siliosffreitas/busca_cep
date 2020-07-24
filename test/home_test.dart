import 'package:busca_cep_app/repository/network/api.dart';
import 'package:busca_cep_app/views/edit_address/edit_address_screen.dart';
import 'package:busca_cep_app/views/home/home_screen.dart';
import 'package:busca_cep_app/views/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:get_it/get_it.dart';
import 'mocks.dart';

void main() {
  group('Teste do home', () {
    MockApi mockApi;
    setUp(() {
      mockApi = MockApi();

      GetIt.instance.reset();
      GetIt.instance.registerSingleton<HomeStore>(HomeStore());
      GetIt.instance.registerSingleton<Api>(mockApi);
    });

    testWidgets(
        'quando abre a tela home deve verificar a existencia dos botõres',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));

      expect(
        find.byIcon(Icons.add),
        findsOneWidget,
      );

      expect(
        find.byTooltip("Novo Endereço"),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate((widget) {
          if (widget is Text) {
            return widget.data == "Últimos endereços";
          }
          return false;
        }),
        findsOneWidget,
      );
    });

    testWidgets(
        'deve navegar para tela de adição de endereço quando clicar no botão de mais',
        (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      final _recoverPassScreen = find.byType(EditAddressScreen);
      expect(_recoverPassScreen, findsOneWidget);
    });
  });
}
