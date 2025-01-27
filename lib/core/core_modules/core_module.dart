import 'package:dio/dio.dart';
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

  @Named('defaultDio')
  @lazySingleton
  Dio dio(Env env) {
    Dio dio = Dio();
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 12),
      sendTimeout: const Duration(seconds: 6),
      headers: null,
      baseUrl: env.baseUrl,
    );
    dio.options = options;

    return dio;
  }
}
