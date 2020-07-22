import 'package:busca_cep_app/repository/network/api.dart';
import 'package:busca_cep_app/views/home/home_screen.dart';
import 'package:busca_cep_app/views/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  _registrarDependencias();
  runApp(MyApp());
}

void _registrarDependencias() {
  GetIt.instance.registerSingleton<HomeStore>(HomeStore());
  GetIt.instance.registerSingleton<Api>(Api());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca Endereço',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
