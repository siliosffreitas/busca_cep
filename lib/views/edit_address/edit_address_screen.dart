import 'package:busca_cep_app/utils/input_mask.dart';
import 'package:busca_cep_app/utils/utils.dart';
import 'package:flutter/material.dart';

class EditAddressScreen extends StatefulWidget {
  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Endereço"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_location),
                    labelText: "CEP",
                    hintText: "00000-000",
                    helperText:
                        "Adicione apenas o CEP e deixe o restante com a gente",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Insira o CEP";
                  }
                  if (value.trim().length != 9) {
                    return "CEP inválido";
                  }
                  String cep = value.trim().replaceAll("-", "");
                  if (!isNumeric(cep)) {
                    return "CEP inválido";
                  }

                  return null;
                },
                inputFormatters: [InputType.CEP.getMask()],
                keyboardType: InputType.CEP.getKeyboardType(),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                controller: _titleController,
                onFieldSubmitted: (term) {
                  _checkData();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkData,
        child: Icon(Icons.done),
        tooltip: "Adicionar este endereço",
      ),
    );
  }

  _checkData() {
    hideSoftKeyboard(context);
    if (_formKey.currentState.validate()) {
//      Navigator.pop(context);
    }
  }
}
