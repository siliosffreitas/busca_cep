import 'package:busca_cep_app/repository/network/api_error.dart';
import 'package:flutter/foundation.dart';

class ApiResponse {
  ApiResponse.success({@required this.result}) {
    this.success = true;
  }

  ApiResponse.error({@required this.error}) {
    this.success = false;
  }

  bool success;
  dynamic result;
  ApiError error;
}
