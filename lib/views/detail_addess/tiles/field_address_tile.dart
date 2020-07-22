import 'package:flutter/material.dart';

class FieldAddressTile extends StatelessWidget {
  final String label;
  final String value;

  const FieldAddressTile({Key key, @required this.label, @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(value.isEmpty ? "-" : value),
      subtitle: Text(label),
    );
  }
}
