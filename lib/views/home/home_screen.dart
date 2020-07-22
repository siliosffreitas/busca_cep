import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Últimos endereços'),
      ),
      body: Observer(
        builder: (_) {
          return Center(
            child: Text("Nenhum endereço cadastrado"),
          );
        },
      ),
    );
  }
}
