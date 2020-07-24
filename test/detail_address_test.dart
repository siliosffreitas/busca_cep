import 'package:busca_cep_app/models/address_model.dart';
import 'package:busca_cep_app/repository/network/api.dart';
import 'package:busca_cep_app/repository/network/api_response.dart';
import 'package:busca_cep_app/views/detail_addess/detail_address_screen.dart';
import 'package:busca_cep_app/views/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

void main() {
  group('Teste Visualização de Endereço', () {
    MockApi mockApi;
    setUp(() {
      mockApi = MockApi();

      GetIt.instance.reset();
      GetIt.instance.registerSingleton<HomeStore>(HomeStore());
      GetIt.instance.registerSingleton<Api>(mockApi);
    });

    testWidgets(
        'quando clica para adicionar um cep e nao tem nenhum cep digitado',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
          home: DetailAddressScreen(
        address: Address(cep: "64010-000"),
      )));

      when(mockApi.zipDetail('64010270')).thenAnswer((_) async {
        final response = {
          "cep": "64010-000",
          "logradouro": "Conjunto Ribeiro Magalhães",
          "complemento": "",
          "bairro": "Mocambinho",
          "localidade": "Teresina",
          "uf": "PI",
          "unidade": "",
          "ibge": "2211001",
          "gia": ""
        };

        Address address = Address.fromJson(response);
        return ApiResponse.success(result: address);
      });

      await tester.pump();
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.bySemanticsLabel("UF"), findsNothing);
    });
  });
}
