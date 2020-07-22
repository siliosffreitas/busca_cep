import 'package:busca_cep_app/repository/network/request_state.dart';
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
      ),
      body: Observer(
        builder: (_) {
          if (_homeStore.stateGetListAddress == RequestState.LOADING) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
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
