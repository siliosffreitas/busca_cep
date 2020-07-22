import 'package:busca_cep_app/models/address_model.dart';
import 'package:busca_cep_app/repository/local/address_helper.dart';
import 'package:busca_cep_app/repository/network/request_state.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  RequestState stateGetListAddress;

  @observable
  RequestState stateGetSaveAddress;

  // TODO testar armazenamento usando um map com a chave sendo a string do cep e o valor sendo o address
  @observable
  List<Address> address;

  @observable
  Address editAdress;

  @action
  getLastsAddress() {
    stateGetListAddress = RequestState.LOADING;
    AddressHelper helper = AddressHelper();
    address = [];
    helper.getAllAddress().then((list) {
//      print(list);
      address = list;
      this.address.sort((a, b) => a.compareTo(b));
      stateGetListAddress = RequestState.SUCCESS;
    });
  }

  @action
  addAddress(String cep) {
    stateGetSaveAddress = RequestState.LOADING;

    Address address = Address(cep: cep, createdAt: DateTime.now());

    AddressHelper helper = AddressHelper();

    helper.saveAddress(address).then((address) {
      editAdress = address;
      this.address.add(address);
      this.address.sort((a, b) => a.compareTo(b));
      this.address = this.address;
      stateGetSaveAddress = RequestState.SUCCESS;
    });
  }

  @action
  resetStateSave() {
    stateGetSaveAddress = null;
  }
}
