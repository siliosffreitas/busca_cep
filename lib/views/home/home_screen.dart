import 'package:busca_cep_app/repository/network/request_state.dart';
import 'package:busca_cep_app/views/edit_address/edit_address_screen.dart';
import 'package:busca_cep_app/views/home/home_store.dart';
import 'package:busca_cep_app/views/home/tiles/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeStore = GetIt.instance<HomeStore>();

  @override
  void initState() {
    super.initState();
    _homeStore.getLastsAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Últimos endereços'),
        actions: <Widget>[
          IconButton(
            tooltip: "Novo Endereço",
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditAddressScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (_homeStore.stateGetListAddress == RequestState.LOADING) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(_homeStore.address == null || _homeStore.address.isEmpty){
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("É novo por aqui? Adicione um novo endereço de entrega agora mesmo.", textAlign: TextAlign.center,),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: _homeStore.address
                .map((address) => AddressTile(
                      address: address,
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
