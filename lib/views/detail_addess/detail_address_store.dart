import 'package:busca_cep_app/models/address_model.dart';
import 'package:busca_cep_app/repository/network/api.dart';
import 'package:busca_cep_app/repository/network/exceptions/no_connection_exception.dart';
import 'package:busca_cep_app/repository/network/exceptions/no_connection_with_server_exception.dart';
import 'package:busca_cep_app/repository/network/exceptions/timeout_exception.dart';
import 'package:busca_cep_app/repository/network/exceptions/zip_not_exists_exception.dart';
import 'package:busca_cep_app/repository/network/request_state.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'detail_address_store.g.dart';

class DetailAddressStore = _DetailAddressStore with _$DetailAddressStore;

abstract class _DetailAddressStore with Store {
  @observable
  RequestState stateGetAddressFromZip;

  @observable
  Address address;

  @action
  getAddressFromZip(String zip) {
    stateGetAddressFromZip = RequestState.LOADING;

    final _api = GetIt.instance<Api>();

    _api.zipDetail(zip).then((response) {
      stateGetAddressFromZip = RequestState.SUCCESS;
      address = response.result;
    }).catchError((error) {
      print(error.error.runtimeType);
      if (error.error is NoConnectionWithServerException) {
        stateGetAddressFromZip = RequestState.NO_CONNECTION_WITH_SERVER;
      } else if (error.error is NoConnectionException) {
        stateGetAddressFromZip = RequestState.NO_CONNECTION;
      } else if (error.error is TimeoutException) {
        stateGetAddressFromZip = RequestState.TIMEOUT;
      } else if (error.error is ZipNotExistsException) {
        stateGetAddressFromZip = RequestState.ZIP_NOT_EXISTS;
      } else {
        stateGetAddressFromZip = RequestState.FAIL;
      }
    });
  }
}
