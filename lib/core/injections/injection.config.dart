// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:grammafy/core/core_modules/core_module.dart' as _i7;
import 'package:grammafy/core/env/env.dart' as _i3;
import 'package:grammafy/core/routes/grammafy_routes.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Env>(() => _i3.Env());
    gh.singleton<_i4.GrammafyRoutes>(() => registerModule.appRouter);
    gh.lazySingleton<_i5.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i6.Dio>(
      () => registerModule.dio(gh<_i3.Env>()),
      instanceName: 'defaultDio',
    );
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
