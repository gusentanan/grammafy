import 'dart:io';

import 'package:dio/dio.dart';
import 'package:grammafy/data/network_data_sources/api/api_config.dart';
import 'package:grammafy/data/network_data_sources/api/api_exception.dart';
import 'package:grammafy/data/network_data_sources/dto/question/chat_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiHelper {
  final Dio _dio;

  ApiHelper(@Named('defaultDio') this._dio);

  Future<Map<String, dynamic>> post({
    required String path,
    required ChatModel data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        options: options,
        data: data.toJson(),
      );
      return ApiConfiguration.handleApiResponse(response);
    } on SocketException {
      return Future.error(NoInternetException());
    } on DioException catch (e) {
      return ApiConfiguration.handleDioErrorResponse(e);
    } catch (e) {
      return Future.error(UnknownException(e));
    }
  }
}
