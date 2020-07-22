// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailAddressStore on _DetailAddressStore, Store {
  final _$stateGetAddressFromZipAtom =
      Atom(name: '_DetailAddressStore.stateGetAddressFromZip');

  @override
  RequestState get stateGetAddressFromZip {
    _$stateGetAddressFromZipAtom.reportRead();
    return super.stateGetAddressFromZip;
  }

  @override
  set stateGetAddressFromZip(RequestState value) {
    _$stateGetAddressFromZipAtom
        .reportWrite(value, super.stateGetAddressFromZip, () {
      super.stateGetAddressFromZip = value;
    });
  }

  final _$addressAtom = Atom(name: '_DetailAddressStore.address');

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$_DetailAddressStoreActionController =
      ActionController(name: '_DetailAddressStore');

  @override
  dynamic getAddressFromZip(String zip) {
    final _$actionInfo = _$_DetailAddressStoreActionController.startAction(
        name: '_DetailAddressStore.getAddressFromZip');
    try {
      return super.getAddressFromZip(zip);
    } finally {
      _$_DetailAddressStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stateGetAddressFromZip: ${stateGetAddressFromZip},
address: ${address}
    ''';
  }
}
