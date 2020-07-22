
import 'package:busca_cep_app/repository/network/exceptions/custom_exception.dart';

class NoConnectionWithServerException implements CustomException {
  @override
  String cause;
}
