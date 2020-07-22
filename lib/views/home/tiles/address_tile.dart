import 'package:busca_cep_app/models/address_model.dart';
import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  final Address address;

  const AddressTile({Key key, @required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(address.cep),
      ),
    );
  }
}
