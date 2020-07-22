import 'package:busca_cep_app/models/address_model.dart';
import 'package:busca_cep_app/repository/network/request_state.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  RequestState stateGetListAddress;

  // TODO testar armazenamento usando um map com a chave sendo a string do cep e o valor sendo o address
  @observable
  List<Address> address;

  @action
  getLastsAddress() {
    stateGetListAddress = RequestState.LOADING;
    address = [];
    for (int i = 0; i < 10; i++) {
      address.add(
        Address.fromJson({
          "cep": "01001-000",
          "logradouro": "Praça da Sé",
          "complemento": "lado ímpar",
          "bairro": "Sé",
          "localidade": "São Paulo",
          "uf": "SP",
          "unidade": "",
          "ibge": "3550308",
          "gia": "1004",
          "createdAt": DateTime.now()
        }),

      );
      Future.delayed(Duration(seconds: 5));
    }
    address = address.sublist(0, 5);
    stateGetListAddress = RequestState.SUCCESS;
  }

  @action
  addAddress(String cep) {
    address.add(Address(cep: cep, createdAt: DateTime.now()));
  }
}
