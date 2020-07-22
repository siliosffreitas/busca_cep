import 'package:busca_cep_app/models/address_model.dart';
import 'package:busca_cep_app/repository/network/request_state.dart';
import 'package:busca_cep_app/views/detail_addess/detail_address_store.dart';
import 'package:busca_cep_app/views/detail_addess/tiles/field_address_tile.dart';
import 'package:busca_cep_app/views/shared/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailAddressScreen extends StatefulWidget {
  final Address address;

  const DetailAddressScreen({Key key, @required this.address})
      : super(key: key);

  @override
  _DetailAddressScreenState createState() => _DetailAddressScreenState();
}

class _DetailAddressScreenState extends State<DetailAddressScreen> {
  final _detailAddressStore = DetailAddressStore();

  @override
  void initState() {
    super.initState();
    _detailAddressStore.getAddressFromZip(widget.address.cep);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.address.cep),
      ),
      body: Observer(
        builder: (_) {
          if (_detailAddressStore.stateGetAddressFromZip ==
              RequestState.LOADING) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (isError(_detailAddressStore.stateGetAddressFromZip)) {
            return ErrorView(
              requestState: _detailAddressStore.stateGetAddressFromZip,
              onTryAgain: () {
                _detailAddressStore.getAddressFromZip(widget.address.cep);
              },
            );
          }
          return ListView(
            children: <Widget>[
              FieldAddressTile(
                value: _detailAddressStore.address.uf,
                label: "UF",
              ),
              FieldAddressTile(
                value: _detailAddressStore.address.localidade,
                label: "Localidade",
              ),
              FieldAddressTile(
                value: _detailAddressStore.address.bairro,
                label: "Bairro",
              ),
              FieldAddressTile(
                value: _detailAddressStore.address.logradouro,
                label: "Logradouro",
              ),
              FieldAddressTile(
                value: _detailAddressStore.address.complemento,
                label: "Complemento",
              ),
              FieldAddressTile(
                value: _detailAddressStore.address.unidade,
                label: "Unidade",
              ),
              FieldAddressTile(
                value: _detailAddressStore.address.ibge,
                label: "IBGE",
              ),
              FieldAddressTile(
                value: _detailAddressStore.address.gia,
                label: "GIA",
              ),
            ],
          );
        },
      ),
    );
  }
}
