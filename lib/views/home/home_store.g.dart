// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$stateGetListAddressAtom =
      Atom(name: '_HomeStore.stateGetListAddress');

  @override
  RequestState get stateGetListAddress {
    _$stateGetListAddressAtom.reportRead();
    return super.stateGetListAddress;
  }

  @override
  set stateGetListAddress(RequestState value) {
    _$stateGetListAddressAtom.reportWrite(value, super.stateGetListAddress, () {
      super.stateGetListAddress = value;
    });
  }

  final _$addressAtom = Atom(name: '_HomeStore.address');

  @override
  List<Address> get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(List<Address> value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  dynamic getLastsAddress() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.getLastsAddress');
    try {
      return super.getLastsAddress();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateGetListAddress: ${stateGetListAddress},
address: ${address}
    ''';
  }
}
