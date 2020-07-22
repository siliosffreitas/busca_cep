import 'dart:convert';
import 'dart:io';

import 'package:busca_cep_app/repository/network/exceptions/custom_exception.dart';
import 'package:busca_cep_app/repository/network/exceptions/no_connection_exception.dart';
import 'package:busca_cep_app/repository/network/exceptions/no_connection_with_server_exception.dart';
import 'package:busca_cep_app/repository/network/exceptions/timeout_exception.dart';
import 'package:busca_cep_app/repository/network/exceptions/zip_not_exists_exception.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CustomInterceptor extends InterceptorsWrapper {
  final Dio dio;

  CustomInterceptor(this.dio);

//  final _loaderController = GetIt.instance<LoaderController>();

  @override
  Future onRequest(RequestOptions options) async {
//    if (![DEVICE].contains(options.path)) {
//      _loaderController.turnOnLoader();
//    }
    print("======================= ON_REQUEST =======================");
    print(options.path);
    print(options.headers);
    print(options.data);
    print(options.queryParameters);

//    options.headers.addAll(await _defineHeader());

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("======================= ON_RESPONSE =======================");
    print(response.request.path);
    print(response.request.method);
    print(response.request.headers);
    print(response.request.data);
    print("RESPOSTA ====> $response");

    print(response.request.path);
    print("===========================================================");

    if (response.data['erro'] != null && response.data['erro']) {
//      print("CEP n existe");
      // não encontrou o cep
      throw ZipNotExistsException();
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    print("======================= ON_ERROR =======================");
    print(err.request.path);

    if (err.error is ZipNotExistsException) {
      // se tiver dado erro de cep nao encontrado, trata logo
      throw ZipNotExistsException();
    }

    try {
      bool conected = await DataConnectionChecker().hasConnection;

      if (!conected) {
        throw NoConnectionException();
      }

      if (err.type == DioErrorType.CONNECT_TIMEOUT ||
          err.type == DioErrorType.RECEIVE_TIMEOUT) {
        throw TimeoutException();
      }

      if (err.error is SocketException) {
        throw NoConnectionWithServerException();
      }

      print("Erro com statusCode: ${err.response.statusCode}");

//      if ((err.response.statusCode == 401 || err.response.statusCode == 403) &&
//          ![LOGIN].contains(err.request.path)) {
//        return await _tryRenoveToken(err);
//      }
    } finally {
//      if (![DEVICE].contains(err.request.path)) {
//        _loaderController.turnOffLoader();
//      }
    }
    return super.onError(err);
  }
}
