import 'package:busca_cep_app/repository/network/exceptions/custom_exception.dart';

class ZipNotExistsException implements CustomException {
  @override
  String cause;
}
