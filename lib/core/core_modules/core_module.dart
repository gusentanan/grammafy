import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grammafy/core/env/env.dart';
import 'package:grammafy/core/routes/grammafy_routes.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Logger get logger => Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          printTime: true,
          errorMethodCount: 5,
        ),
      );

  @singleton
  GrammafyRoutes get appRouter => GrammafyRoutes();

  @dev
  String get apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';

  @Named('defaultDio')
  @lazySingleton
  Dio dio(Env env) {
    Dio dio = Dio();
    BaseOptions options = BaseOptions(headers: {
      'Content-Type': 'application/json',
    }, baseUrl: env.baseUrl, persistentConnection: true);
    dio.options = options;

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add the API key as query parameter to each request if it's not already included
        if (!options.queryParameters.containsKey('key')) {
          options.queryParameters['key'] = apiKey;
        }
        return handler.next(options);
      },
    ));

    return dio;
  }
}
