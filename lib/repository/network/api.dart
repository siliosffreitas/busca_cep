import 'package:busca_cep_app/models/address_model.dart';
import 'package:busca_cep_app/repository/network/api_response.dart';
import 'package:busca_cep_app/repository/network/custom_interceptor.dart';
import 'package:busca_cep_app/repository/network/routes.dart';
import 'package:dio/dio.dart';

import 'consts.dart';

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = BASE_URL;
    _dio.options.connectTimeout = TIMEOUT;
    _dio.options.receiveTimeout = TIMEOUT;
    _dio.interceptors.add(CustomInterceptor(_dio));
  }

  Future<ApiResponse> zipDetail(String zip) async {
    Response response = await _dio.get(ZIP_DETAILS(zip));
    Address address = Address.fromJson(response.data);
    return ApiResponse.success(result: address);
  }
}
