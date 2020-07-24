import 'package:busca_cep_app/main.dart';
import 'package:busca_cep_app/models/address_model.dart';
import 'package:busca_cep_app/repository/network/api.dart';
import 'package:busca_cep_app/repository/network/api_response.dart';
import 'package:busca_cep_app/views/detail_addess/detail_address_screen.dart';
import 'package:busca_cep_app/views/edit_address/edit_address_screen.dart';
import 'package:busca_cep_app/views/home/home_screen.dart';
import 'package:busca_cep_app/views/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'mocks.dart';

//findMaidaInputText({
//  String labelText,
//  String hintText,
//}) {
//  return find.byWidgetPredicate((widget) {
//    if (widget is MaidaInputText) {
//      return widget.labelText == labelText && widget.hintText == hintText;
//    }
//    return false;
//  });
//}

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

//      find.byIcon(Icons.add);

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

//
//    testWidgets(
//        'deve retornar erro de senha invalida quando inserir senha incorreta',
//            (tester) async {
//          await tester.pumpWidget(MaterialApp(
//            home: LoginScreen(),
//            // theme: maidaTheme(),
//          ));
//
//          await tester.enterText(
//            findMaidaInputText(labelText: 'CPF', hintText: 'Digite aqui o seu CPF'),
//            '472.159.770-30',
//          );
//
//          await tester.enterText(
//            findMaidaInputText(
//                labelText: 'Senha', hintText: 'Digite aqui a sua senha'),
//            '000000',
//          );
//
//          when(mockApi.login(username: '47215977030', password: '000000'))
//              .thenThrow(DynamicError(error: Exception()));
//          await tester.tap(find.widgetWithText(MaidaFlatButton, 'ENTRAR'));
//          await tester.pump();
//          final errorSenhaInvalida = find.byWidgetPredicate((widget) {
//            if (widget is MaidaDangerAlert)
//              return widget.content == 'Usuário/senha inválidos';
//
//            return false;
//          });
//          expect(errorSenhaInvalida, findsOneWidget);
//
//          await tester.pump(Duration(seconds: 5));
//          expect(errorSenhaInvalida, findsNothing);
//        });
//
//    testWidgets(
//        'deve retornar erro de CPF e Senha vazios quando nenhum dos campos estiver preenchido ao tentar logar',
//            (tester) async {
//          await tester.pumpWidget(MaterialApp(
//            home: LoginScreen(),
//            // theme: maidaTheme(),
//          ));
//
//          await tester.tap(find.widgetWithText(MaidaFlatButton, 'ENTRAR'));
//          await tester.pump();
//
//          final _errorCpf = find.text('Insira seu CPF para entrar');
//          expect(_errorCpf, findsOneWidget);
//
//          final _errorPass = find.text('Insira sua senha para entrar');
//          expect(_errorPass, findsOneWidget);
//        });
//
//    testWidgets('deve retornar sucesso quando logar com dados corretos',
//            (tester) async {
//          final _profileStore = GetIt.I.get<ProfileStore>()
//            ..initProfile(newProfile: UserProfile());
//          await tester.pumpWidget(MaterialApp(
//            home: Observer(
//              builder: (_) {
//                if (_profileStore.profile.accessToken == null) {
//                  return LoginScreen();
//                }
//                return Scaffold(body: Center(child: Text("Outra tela")));
//              },
//            ),
//            // theme: maidaTheme(),
//          ));
//
//          await tester.enterText(
//            findMaidaInputText(labelText: 'CPF', hintText: 'Digite aqui o seu CPF'),
//            '472.159.770-30',
//          );
//
//          await tester.enterText(
//            findMaidaInputText(
//                labelText: 'Senha', hintText: 'Digite aqui a sua senha'),
//            '000000',
//          );
//
//          when(mockApi.login(username: '47215977030', password: '000000'))
//              .thenAnswer((_) async {
//            final response = {
//              "urlProfile": null,
//              "name": "Homer Simpson",
//              "cpf": "47215977030",
//              "email": "homersimpson@gmail.com",
//              "token":
//              "tokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokenteste"
//            };
//            UserProfile userLogin = UserProfile.fromJson(response);
//
//            return ApiResponse.success(result: userLogin);
//          });
//          await tester.tap(find.widgetWithText(MaidaFlatButton, 'ENTRAR'));
//          await tester.pump();
//          await tester.pump();
//          await tester.pumpAndSettle();
//
//          final _loginFinder = find.byType(LoginScreen);
//          expect(_loginFinder, findsNothing);
//
//          final _otherScreenFinder = find.text("Outra tela");
//          expect(_otherScreenFinder, findsOneWidget);
//        });
//

    testWidgets(
        'deve navegar para tela de adição de endereço quando clicar no botão de mais',
        (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      final _recoverPassScreen = find.byType(EditAddressScreen);
      expect(_recoverPassScreen, findsOneWidget);
    });

    // testWidgets(
    //     'deve salvar os dados de perfil corretamente quando logar com dados corretos',
    //     (tester) async {
    //   final _profileStore = GetIt.I.get<ProfileStore>();
    //   _profileStore.initProfile(newProfile: UserProfile());

    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Observer(
    //         builder: (_) {
    //           if (_profileStore.profile.accessToken == null) {
    //             return LoginScreen();
    //           }
    //           return Scaffold(body: Center(child: Text("Outra tela")));
    //         },
    //       ),
    //       // theme: maidaTheme(),
    //     ),
    //   );

    //   await tester.enterText(
    //     findMaidaInputText(labelText: 'CPF', hintText: 'Digite aqui o seu CPF'),
    //     '472.159.770-30',
    //   );

    //   await tester.enterText(
    //     findMaidaInputText(
    //         labelText: 'Senha', hintText: 'Digite aqui a sua senha'),
    //     '000000',
    //   );
    //   print("=======> 1");
    //   when(mockApi.login(username: '47215977030', password: '000000'))
    //       .thenAnswer((teste) async {
    //     final response = {
    //       "urlProfile": null,
    //       "name": "Homer Simpson",
    //       "cpf": "47215977030",
    //       "email": "homersimpson@gmail.com",
    //       "token":
    //           "tokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokentestetokenteste"
    //     };
    //     UserProfile userLogin = UserProfile.fromJson(response);
    //     print("=======> 2");
    //     // final aT = await _saveProfile(userLogin);
    //     // print(aT);

    //     print("=======> 3");
    //     // _saveNewAccess(
    //     // Access.fromJson({"username": username, "password": password}));

    //     return ApiResponse.success(result: userLogin);
    //   });
    //   await tester.tap(find.widgetWithText(MaidaFlatButton, 'ENTRAR'));
    //   await tester.pump();
    //   final userLogin = _profileStore.profile;
    //   print("=======> 4");
    //   // final aT = await _saveProfile(userLogin);
    //   // print(aT);
    //   // final at = await readProfile();
    //   final file = File("test_resources/profile_pref.json");
    //   final at = await file.readAsString();
    //   print(at);
    //   file.writeAsString(
    //       json.encode({"usuario": "Max Lima", "senha": "123456"}));
    //   // final _loadedProfile = await readProfile();
    //   // print("=======> 5");
    //   // print(_loadedProfile);
    //   // expect(json.decode(_loadedProfile), _profileStore.profile.toJson());
    // });
  });
}
