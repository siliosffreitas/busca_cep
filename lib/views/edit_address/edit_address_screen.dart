import 'package:busca_cep_app/repository/network/request_state.dart';
import 'package:busca_cep_app/utils/input_mask.dart';
import 'package:busca_cep_app/utils/utils.dart';
import 'package:busca_cep_app/views/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class EditAddressScreen extends StatefulWidget {
  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();

  final _homeStore = GetIt.instance<HomeStore>();

  ReactionDisposer _listen;

  @override
  void initState() {
    super.initState();
    _listen = _listenFunction();
  }

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
      floatingActionButton: Observer(
        builder: (_) {
          return FloatingActionButton(
            onPressed: _homeStore.stateGetSaveAddress == RequestState.LOADING
                ? null
                : _checkData,
            child: _homeStore.stateGetSaveAddress == RequestState.LOADING
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Icon(Icons.done),
            tooltip: "Adicionar este endereço",
          );
        },
      ),
    );
  }

  _checkData() {
    hideSoftKeyboard(context);
    if (_formKey.currentState.validate()) {
      _homeStore.addAddress(_titleController.text);
//      Navigator.pop(context);
    }
  }

  ReactionDisposer _listenFunction() {
    return autorun((_) {
      switch (_homeStore.stateGetSaveAddress) {
        case RequestState.SUCCESS:
          print("Endereço cadastrado com sucesso");
          Navigator.of(context).pop("Endereço cadastrado com sucesso");
//          Navigator.pop(context, "Endereço cadastrado com sucesso");

          break;
        case RequestState.FAIL:
        case RequestState.TIMEOUT:
        case RequestState.NO_CONNECTION:
        case RequestState.NO_CONNECTION_WITH_SERVER:
          messageError(context);
          break;
        default:
      }
    });
  }

  @override
  void dispose() {
    _homeStore.resetStateSave();
    _listen();
    super.dispose();
  }
}
